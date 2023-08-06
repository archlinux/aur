# Maintainer: Philipp Uhl <philipp.uhl@rwth-aachen.de>

pkgname=deadd-notification-center-bin
pkgver=2.1.1
pkgrel=1
pkgdesc="Customizable notification-daemon with notification center"
url="https://github.com/phuhl/linux_notification_center"
license=("BSD")
arch=('x86_64')
depends=('gobject-introspection-runtime' 'gtk3')
provides=('deadd-notification-center')
conflicts=('deadd-notification-center' 'deadd-notification-center-git')
DLAGENTS=('https::/usr/bin/curl -L -o %o %u')
source=(
    "deadd-notification-center::https://github.com/phuhl/linux_notification_center/releases/download/${pkgver}/deadd-notification-center",
    "${pkgname}-${pkgver}.tar.gz::https://codeload.github.com/phuhl/linux_notification_center/tar.gz/refs/tags/${pkgver}")

prepare() {
    tar -zxvf "${pkgname}-${pkgver}.tar.gz"
    mkdir "linux_notification_center-${pkgver}/.out"
    mv deadd-notification-center "linux_notification_center-${pkgver}/.out/deadd-notification-center"
}

build() {
    cd "linux_notification_center-${pkgver}"
}

package() {
    cd "linux_notification_center-${pkgver}"
    make service
    make DESTDIR="$pkgdir" install
}

sha256sums=('0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5'
            'e83cae52aff076da8f199d64580e921eeab029aca6214937ab38a6c43145862b')
