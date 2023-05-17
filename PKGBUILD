# Maintainer: silverhikari <kerrickethan@gmail.com>
pkgname=clk-sdl
pkgver=2023_05_15
pkgrel=2
epoch=
pkgdesc="a latency hating emulator for 8 and 16 bit platforms(sdl version)"
arch=(x86_64)
url="https://github.com/TomHarte/CLK"
license=('MIT')
depends=('sdl2')
makedepends=('scons')
provides=('clksignal')
conflicts=('clk-qt' 'clk-qt-git' 'clk-sdl-git')
source=("https://github.com/TomHarte/CLK/archive/refs/tags/${pkgver//_/-}.tar.gz" "680000-removal.patch")
noextract=()
install="clk.install"
sha256sums=('499b5588936b9ac63864f7399007e8c154a5e08dc4400dd3b7645a90330ae39b' 'SKIP')

# added even though it can build without unlike qt version, but is here encase their is any underlying issues

prepare() {
cd "CLK-${pkgver//_/-}/"
patch -p1 -i "../680000-removal.patch"
}

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
