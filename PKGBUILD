# Maintainer: Clayton Craft <clayton at craftyguy dot net>
pkgname=hidviz
pkgver=0.1.4
pkgrel=1
pkgdesc="Tool for in-depth analysis of USB HID devices communication"
arch=('i686' 'x86_64')
url="https://github.com/ondrejbudai/hidviz"
license=('GPL3')
depends=('libusb' 'protobuf' 'qt5-base' 'cmake')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("http://hidviz.org/releases/$pkgname-$pkgver.tar.gz")
sha256sums=('a68f5626b184c76cc54bd60735b6fbe715d86958f9a4ef3147b30b9bb8dbff9b')
prepare() {
        cd "${pkgname}-${pkgver}"
        mkdir -p build
        cd build
        cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib ..
}

build() {
        cd "${pkgname}-${pkgver}"/build
        make
}

package() {
        cd "${pkgname}-${pkgver}"/build
        make DESTDIR="${pkgdir}" install
}

