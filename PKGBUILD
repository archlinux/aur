# Maintainer: silverhikari <kerrickethan@gmail.com>
pkgname=clk-qt
pkgver=2026_04_21
pkgrel=1
epoch=
pkgdesc="a latency hating emulator for 8 and 16 bit platforms(qt version)"
arch=(x86_64)
url="https://github.com/TomHarte/CLK"
license=('MIT')
depends=('qt6-base' 'qt6-multimedia' 'zlib' 'libglvnd' 'libx11')
makedepends=("cmake")
provides=('clksignal')
conflicts=('clk-sdl' 'clk-qt-git' 'clk-sdl-git')
source=("https://github.com/TomHarte/CLK/archive/refs/tags/${pkgver//_/-}.tar.gz")
noextract=()
install="clk.install"
sha256sums=('fbb3dccc93ed8d91552d1ea935f96536a7a258a4b80caa1a0dc1dc0bca7ff292')

build() {
	local cmake_options=(
    -B build
    -S CLK-${pkgver//_/-}
    -W no-dev
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_INSTALL_PREFIX=/usr
    -DCLK_UI=Qt
  )
  cmake "${cmake_options[@]}"
  cmake --build build
}

package() {
	install -d "${pkgdir}/usr/share/CLK/"
	install -d "${pkgdir}/usr/local/share/CLK"
	cd "CLK-${pkgver//_/-}"
	install -Dm755 LICENCE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	cd "${srcdir}/build"
	install -Dm755 clksignal "${pkgdir}/usr/bin/clksignal"
}
