# Maintainer: Dmytro Bagrii <dimich.dmb@gmail.com>

pkgname=spi-ch341-usb-dkms-git
pkgver=r47.71971ce
pkgver() {
    cd "$srcdir/spi-ch341-usb"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
pkgrel=1
pkgdesc="SPI/GPIO driver for CH341"
arch=(any)
url="https://github.com/gschorcht/spi-ch341-usb"
license=('GPL')
groups=()
depends=()
conflicts=('spi-ch341-usb-dkms')
makedepends=('git')
source=('git+https://github.com/dimich-dmb/spi-ch341-usb.git')
sha256sums=('SKIP')

package() {
    install -Dm0644 -t "${pkgdir}"/usr/src/spi-ch341-usb-${pkgver} \
        "${srcdir}"/spi-ch341-usb/Makefile \
        "${srcdir}"/spi-ch341-usb/spi-ch341-usb.c \
        "${srcdir}"/spi-ch341-usb/dkms.conf
    sed -i "s/^PACKAGE_VERSION=.*\$/PACKAGE_VERSION=\"${pkgver}\"/" "${pkgdir}"/usr/src/spi-ch341-usb-${pkgver}/dkms.conf

    install -Dm644 -t "${pkgdir}"/usr/lib/udev/rules.d "${srcdir}"/spi-ch341-usb/udev/99-spi-ch341-usb.rules
}
