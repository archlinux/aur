# Maintainer: Josh Holmer <jholmer.in@gmail.com>

_plug=vszip
pkgname=vapoursynth-plugin-${_plug}
pkgver=r13
pkgrel=1
pkgdesc="Plugin for VapourSynth: ${_plug}"
arch=('x86_64')
url='https://github.com/dnjulek/vapoursynth-zip'
license=('MIT')
depends=('vapoursynth')
makedepends=('zig')
source=("https://github.com/dnjulek/vapoursynth-zip/archive/refs/tags/R13.tar.gz")
sha256sums=('d8916f1d04fae4123a48c53e37b15ca015cb4a8a4f6e43e75c870ac2524dd0e0')

build() {
	cd "vapoursynth-zip-R13"
	zig build -Doptimize=ReleaseFast
}

package() {
	cd "vapoursynth-zip-R13"

	install -Dm755 zig-out/lib/libvszip.so "${pkgdir}/usr/lib/vapoursynth/libvszip.so"
	install -Dm644 README.md "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.md"
}
