# Maintainer: silverhikari <kerrickethan@gmail.com>
pkgname=clk-sdl
pkgver=2023_12_26
pkgrel=1
epoch=
pkgdesc="a latency hating emulator for 8 and 16 bit platforms(sdl version)"
arch=(x86_64)
url="https://github.com/TomHarte/CLK"
license=('MIT')
depends=('sdl2' 'zlib' 'libglvnd')
makedepends=('scons')
provides=('clksignal')
conflicts=('clk-qt' 'clk-qt-git' 'clk-sdl-git')
source=("https://github.com/TomHarte/CLK/archive/refs/tags/${pkgver//_/-}.tar.gz")
noextract=()
install="clk.install"
sha256sums=('59d33c33c5596acdbe427ed1673e2001c9b30339fc90273e82cd65d32a6ac899')

build() {
	cd "CLK-${pkgver//_/-}/OSBindings/SDL/"
	scons
}

package() {
	install -d "${pkgdir}/usr/share/CLK/"
	install -d "${pkgdir}/usr/local/share/CLK"
	cd "CLK-${pkgver//_/-}"
	install -Dm755 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	cd "${srcdir}/CLK-${pkgver//_/-}/OSBindings/SDL/"
	install -Dm755 clksignal "${pkgdir}/usr/bin/clksignal"
}
