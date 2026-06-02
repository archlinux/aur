# Maintainer: Josh Holmer <jholmer.in@gmail.com>

_plug=zsmooth
pkgname=vapoursynth-plugin-${_plug}
pkgver=0.15.3
pkgrel=1
pkgdesc="Plugin for VapourSynth: ${_plug}"
arch=('x86_64')
url='https://github.com/adworacz/zsmooth'
license=('MIT')
depends=('vapoursynth')
makedepends=('zig0.15-bin')
source=("https://github.com/adworacz/zsmooth/archive/refs/tags/0.15.3.tar.gz")
sha256sums=('414da028b471442d39b6da735a21ebeae152dce460662c44746f35b69107afcd')

build() {
	cd "zsmooth-0.15.3"
	/opt/zig0.15/zig build -Doptimize=ReleaseFast
}

package() {
	cd "zsmooth-0.15.3"

	install -Dm755 zig-out/lib/libzsmooth.so "${pkgdir}/usr/lib/vapoursynth/libzsmooth.so"
	install -Dm644 README.md "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.md"
	install -Dm644 LICENSE "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/LICENSE"
}
