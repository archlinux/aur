# Maintainer: silverhikari <kerrickethan@gmail.com>
pkgname=clk-sdl
pkgver=2022_07_08
pkgrel=1
epoch=
pkgdesc="a latency hating emulator for 8 and 16 bit platforms(sdl version)"
arch=(x86_64)
url="https://github.com/TomHarte/CLK"
license=('MIT')
depends=('sdl2')
makedepends=('scons')
provides=('clksignal')
conflicts=('clk-qt' 'clk-qt-git' 'clk-sdl-git')
source=("https://github.com/TomHarte/CLK/archive/refs/tags/${pkgver//_/-}.tar.gz")
noextract=()
install="clk.install"
sha256sums=('86b05ddd18516ab0ad1211117581869ba8ca6af65f9f25bdaaabbf2e11c5c85a')

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
