# Maintainer: TheFeelTrain <the@feeltra.in>
# Contributor: Josh Holmer <jholmer.in@gmail.com>

_plug=vszip
pkgname=vapoursynth-plugin-${_plug}
pkgver=23.1.0
pkgrel=2
pkgdesc="Plugin for VapourSynth: ${_plug}"
arch=('x86_64')
url='https://github.com/dnjulek/vapoursynth-zip'
license=('MIT')
depends=('vapoursynth')
makedepends=('zig')
source=("https://github.com/dnjulek/vapoursynth-zip/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('9b91a89d1ca75e6e5ee993880148b5a38c88bcec237b9691476aa0fd28aac111')

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
