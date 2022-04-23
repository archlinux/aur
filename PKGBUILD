# Maintainer: Kazel <address at domain dot tld>
pkgname=usbguard-applet-qt
pkgver=0.7.8
pkgrel=1
pkgdesc="USBguard QT GUI"
arch=("x86_64")
url="https://gitlab.com/WheelchairArtist/usbguard-applet-qt"
license=('GPL2')
depends=("usbguard")
makedepends=("qt5-base")
source=($url/-/archive/$pkgver/usbguard-applet-qt-$pkgver.tar.gz?path=src)
sha512sums=("SKIP")

prepare() {
    cd "${srcdir}/usbguard-applet-qt-$pkgver-src/src"
    qmake-qt5 -o Makefile usbguard-applet-qt.pro
    #uic-qt5 -o DeviceDialog.ui.h DeviceDialog.ui
    #uic-qt5 -o MainWindow.ui.h MainWindow.ui
}

build() {
    cd "${srcdir}/usbguard-applet-qt-$pkgver-src/src"
    make
}

package() {
    install -Dm 0755 -o root -g root "${srcdir}/usbguard-applet-qt-$pkgver-src/src/$pkgname" "${pkgdir}/usr/bin/$pkgname"
    install -Dm 0644 -o root -g root "${srcdir}/usbguard-applet-qt-$pkgver-src/src/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
