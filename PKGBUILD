# Maintainer: Genki Marshall <genki at genki dot is>

pkgname=mxt-app-git
pkgver=20160906.baa2ab8
pkgrel=1
pkgdesc='Command line utility for Atmel maXTouch devices'
arch=('x86_64')
license=('BSD-2-Clause')
depends=('libusb')
makedepends=('git' 'pandoc')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
url="https://github.com/atmel-maxtouch/mxt-app"
source=('git://github.com/atmel-maxtouch/mxt-app')
sha1sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    git log -1 --format='%cd.%h' --date=short | tr -d -
}

build() {
    cd "$srcdir/${pkgname%-git}"
    ./autogen.sh --prefix=/usr --enable-man && make
}

package() {
    cd "$srcdir/${pkgname%-git}"
    make DESTDIR="$pkgdir" install
}
