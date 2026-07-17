# Maintainer: Josh Holmer <jholmer.in@gmail.com>

_plug=vszip
pkgname=vapoursynth-plugin-${_plug}
pkgver=22.1.0
pkgrel=1
pkgdesc="Plugin for VapourSynth: ${_plug}"
arch=('x86_64')
url='https://github.com/dnjulek/vapoursynth-zip'
license=('MIT')
depends=('vapoursynth>=75')
makedepends=('zig>=0.16.0' 'zig<0.17.0')
source=("https://github.com/dnjulek/vapoursynth-zip/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('2189c343ad0a33bc4f10d8c80280d4dfd7a157f601105e96db30c436523f7513')

build() {
	cd "vapoursynth-zip-${pkgver}"
	zig build -Doptimize=ReleaseFast
}

package() {
	cd "vapoursynth-zip-${pkgver}"
	PLUGINDIR=$(python3 -c "import vapoursynth; print(vapoursynth.get_plugin_dir())")

	install -Dm755 zig-out/lib/libvszip.so "${pkgdir}${PLUGINDIR}/libvszip.so"
	install -Dm644 README.md "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.md"
}
