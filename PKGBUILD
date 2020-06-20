# Maintainer: Matthew Leach <matthew at mattleach dot net>

pkgname=ite-backlight
pkgver=1.0
pkgrel=1
pkgdesc="Programs to manage ITE (8291) keyboard backlight devices"
url='https://github.com/hexagonal-sun/ite-backlight'
license=('MIT')
arch=('i686' 'x86_64')
depends=('libusb')
makedepends=('microsoft-gsl' 'meson' 'boost')
source=("${url}/archive/v${pkgver}.tar.gz"
        10-ite-backlight.rules)

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    meson setup build
    ninja -C build
}

package() {
    mkdir -p $pkgdir/usr/lib/udev/rules.d/
    cp 10-ite-backlight.rules $pkgdir/usr/lib/udev/rules.d/

    cd "${srcdir}/${pkgname}-${pkgver}"
    DESTDIR="$pkgdir" ninja -C build install
}

md5sums=('88ff3b9df1489de7f69e2c11ca821b86'
         '7867b4c7d1b354c34a06ffbfe8fc8d32')
