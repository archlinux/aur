# Maintainer: Josh Holmer <jholmer.in@gmail.com>

_plug=vszip
pkgname=vapoursynth-plugin-${_plug}
pkgver=13.0.0
pkgrel=1
pkgdesc="Plugin for VapourSynth: ${_plug}"
arch=('x86_64')
url='https://github.com/dnjulek/vapoursynth-zip'
license=('MIT')
depends=('vapoursynth')
makedepends=('zig')
source=("https://github.com/dnjulek/vapoursynth-zip/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('331eb044845f8530a242865e1854f48454f2cd978a17f84cdfdf29caf79f2b4b')

build() {
	cd "vapoursynth-zip-${pkgver}"
	zig build -Doptimize=ReleaseFast
}

package() {
	cd "vapoursynth-zip-${pkgver}"

	install -Dm755 zig-out/lib/libvszip.so "${pkgdir}/usr/lib/vapoursynth/libvszip.so"
	install -Dm644 README.md "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.md"
}
