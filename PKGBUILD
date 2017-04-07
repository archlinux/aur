# Maintainer: Genki Sky <arch at genki dot is>

pkgname=mxt-app-git
pkgver=20161102.6d84bb0
pkgrel=1
pkgdesc='Command line utility for Atmel maXTouch devices'
arch=('i686' 'x86_64')
url='https://github.com/atmel-maxtouch/mxt-app'
license=('BSD-2-Clause')
depends=('libusb')
makedepends=('git' 'pandoc')
provides=('mxt-app')
conflicts=('mxt-app')
source=('git://github.com/atmel-maxtouch/mxt-app')
md5sums=('SKIP')

pkgver() {
    cd mxt-app
    git log -1 --format='%cd.%h' --date=short | tr -d -
}

build() {
    cd mxt-app
    ./autogen.sh --prefix=/usr --enable-man
    make
}

package() {
    cd mxt-app
    make DESTDIR="$pkgdir" install
    install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/mxt-app/LICENSE
}
