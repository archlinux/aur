# Maintainer: Josh Holmer <jholmer.in@gmail.com>

_plug=zsmooth
pkgname=vapoursynth-plugin-${_plug}
pkgver=0.19.0
pkgrel=1
pkgdesc="Plugin for VapourSynth: ${_plug}"
arch=('x86_64')
url='https://github.com/adworacz/zsmooth'
license=('MIT')
depends=('vapoursynth')
makedepends=('zig>=0.16' 'zig<0.17')
source=("https://github.com/adworacz/zsmooth/archive/refs/tags/0.19.0.tar.gz")
sha256sums=('0a18195f27b5f27ab5788eb133d07f8de1f93cc60bdef02c8448ac37ad6fdb43')

build() {
	cd "zsmooth-0.19.0"
	zig build -Doptimize=ReleaseFast
}

package() {
	cd "zsmooth-0.19.0"

	install -Dm755 zig-out/lib/libzsmooth.so "${pkgdir}/usr/lib/vapoursynth/libzsmooth.so"
	install -Dm644 README.md "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.md"
	install -Dm644 LICENSE "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/LICENSE"
}
