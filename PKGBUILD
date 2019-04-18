# Maintainer: Sam Linnfer <littlelightlittlefire@gmail.com>
pkgname=souffle-git
pkgver=r3910.7ce84469
pkgrel=1
pkgdesc="Soufflé is a translator of declarative Datalog programs into the C++ language"
arch=('any')
url="https://github.com/souffle-lang/souffle"
license=('UPL')
groups=()
depends=('sqlite' 'python' 'zlib')
makedepends=('git' 'autoconf' 'automake' 'bison' 'doxygen' 'flex' 'sqlite' 'libtool' 'jdk8-openjdk' 'pkg-config' 'python' 'zlib' 'mcpp')
provides=('souffle-git')
conflicts=('souffle-git')
backup=()
options=()
install=
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

    make -j
}

check() {
    cd "$srcdir/${pkgname%-git}"
    TESTSUITEFLAGS=-j8 make check
}

package() {
    cd "$srcdir/${pkgname%-git}"
    make DESTDIR="$pkgdir/" install
}
