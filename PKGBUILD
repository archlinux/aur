# Maintainer: Clayton Craft <clayton at craftyguy dot net>
pkgname=hidviz
pkgver=0.1.3
pkgrel=1
pkgdesc="Tool for in-depth analysis of USB HID devices communication"
arch=('i686' 'x86_64')
url="https://github.com/ondrejbudai/hidviz"
license=('GPL3')
depends=('libusb' 'protobuf' 'qt5-base' 'cmake')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("http://hidviz.org/releases/$pkgname-$pkgver.tar.gz")
sha256sums=('8ac8df2712ad1b88c824d591d53230ec0f923ffeb1f1dc20126c1e55ee84b5e0')
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

