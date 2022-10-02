# Maintainer: silverhikari <kerrickethan@gmail.com>
pkgname=iir1
pkgver=1.9.3
pkgrel=1
epoch=
pkgdesc="a DSP IIR realtime filter library written in C++"
arch=('x86_64')
url="https://github.com/berndporr/iir1"
license=('MIT')
depends=('gcc-libs')
makedepends=('gcc' 'cmake')
provides=('iir1')
source=("$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('de241ef7a3e5ae8e1309846fe820a2e18978aa3df3922bd83c2d75a0fcf4e78f')

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
