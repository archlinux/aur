# Maintainer: Philipp Uhl <philipp.uhl@rwth-aachen.de>

pkgname=deadd-notification-center-bin
pkgver=1.7.2
pkgrel=1
pkgdesc="Customizable notification-daemon with notification center"
url="https://github.com/phuhl/linux_notification_center"
license=("BSD")
arch=('x86_64')
depends=('gobject-introspection-runtime' 'gtk3')
conflicts=('deadd-notification-center')

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/phuhl/linux_notification_center/archive/${pkgver}.tar.gz"
  "deadd-notification-center ::https://github.com/phuhl/linux_notification_center/releases/download/${pkgver}/deadd-notification-center")
prepare() {
    tar -zxvf "${pkgname}-${pkgver}.tar.gz"
    mkdir -p linux_notification_center-${pkgver}/.out
    mv deadd-notification-center linux_notification_center-${pkgver}/.out/
}
build() {
    cd "linux_notification_center-${pkgver}"
}

package() {
    cd "linux_notification_center-${pkgver}"
    make service
    make DESTDIR="$pkgdir" install
}
md5sums=('4bd3ee0648ec286293c2e275c8403511'
         'ae7990ed0f089cb0f5ae99d4ad3462c1')
