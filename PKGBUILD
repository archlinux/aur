# Maintainer: silverhikari <kerrickethan@gmail.com>
pkgname=iir1
pkgver=1.10.0
pkgrel=1
epoch=
pkgdesc="a DSP IIR realtime filter library written in C++"
arch=('x86_64' 'aarch64')
url="https://github.com/berndporr/iir1"
license=('MIT')
depends=('gcc-libs')
makedepends=('gcc' 'cmake')
provides=('iir1')
source=("$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('13b53f14d276adf6cafd3564fcda1d4b3e72342108d1c40ec4b4f0c7fc3ac95a')

build() {
    cmake -B build -S "${pkgname}-${pkgver}" \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -Wno-dev
    cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
	cd "${pkgname}-${pkgver}"
	install -Dm755 "COPYING" "$pkgdir/usr/share/licenses/iir1/LICENSE"
}
