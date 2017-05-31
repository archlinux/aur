# Maintainer: Sam Linnfer <littlelightlittlefire@gmail.com>
pkgname=souffle-git
pkgver=r1390.2b4ccd0
pkgrel=1
pkgdesc="Soufflé is a translator of declarative Datalog programs into the C++ language"
arch=('any')
url="https://github.com/souffle-lang/souffle"
license=('UPL')
groups=()
depends=('bison' 'doxygen' 'flex' 'sqlite' 'libtool' 'pkg-config' 'jdk8-openjdk' 'pkg-config' 'python' 'zlib')
makedepends=('git' 'autoconf' 'automake' 'bison' 'doxygen' 'flex' 'sqlite' 'libtool' 'pkg-config' 'jdk8-openjdk' 'pkg-config' 'python' 'zlib')
provides=('${pkgname%-git}')
conflicts=('${pkgname%-git}')
backup=()
options=()
install=
source=()
noextract=()
source=('git+https://github.com/souffle-lang/souffle.git')
md5sums=('SKIP')

_gitname=souffle

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/${pkgname%-git}"
    sh ./bootstrap
    ./configure --prefix=/usr
    make
    make check
}

package() {
    cd "$srcdir/${pkgname%-git}"
    make DESTDIR="$pkgdir/" install
}
