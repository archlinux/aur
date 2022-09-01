# Maintainer: Nick Levesque <nick.levesque@gmail.com>
# Contributor: Kevin Hanselman <kevin-hanselman@gmail.com>
pkgname=fwup-git
pkgver=e8b8629
pkgrel=1
pkgdesc="Configurable embedded Linux firmware update creator and runner (latest from git master)"
arch=('any')
url="https://github.com/fwup-home/fwup"
license=('Apache v2.0')
groups=()
depends=('libsodium' 'libarchive' 'confuse' 'mtools' 'unzip' 'libtool' 'zip' 'help2man' 'autoconf' 'xdelta3' 'dosfstools')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('git+https://github.com/fwup-home/fwup' )
noextract=()
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf "%s" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/${pkgname%-git}"
    ./autogen.sh
    ./configure --prefix=/usr
    make
}

check() {
    cd "$srcdir/${pkgname%-git}"
    make check
}

package() {
    cd "$srcdir/${pkgname%-git}"
    make DESTDIR="$pkgdir/" install
}
