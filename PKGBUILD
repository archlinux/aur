# Maintainer: Kevin Hanselman <kevin-hanselman@gmail.com>
pkgname=fwup-git
pkgver=v0.8.0.r5.6116487
pkgrel=1
pkgdesc="Configurable embedded Linux firmware update creator and runner"
arch=('any')
url="https://github.com/fhunleth/fwup"
license=('Apache v2.0')
groups=()
depends=('libsodium' 'libarchive' 'confuse')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('git+https://github.com/fhunleth/fwup')
noextract=()
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
    cd "$srcdir/${pkgname%-git}"
    ./autogen.sh
    ./configure --prefix=/usr
    make
}

package() {
    cd "$srcdir/${pkgname%-git}"
    make DESTDIR="$pkgdir/" install
}
