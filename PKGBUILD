# Maintainer: TheFeelTrain <the@feeltra.in>

_plug=vszipcl
pkgname=vapoursynth-plugin-${_plug}
pkgver=1.2.0
pkgrel=1
pkgdesc="Plugin for VapourSynth: ${_plug}"
arch=('x86_64')
url='https://github.com/dnjulek/vapoursynth-zipcl'
license=('MIT')
depends=('vapoursynth')
makedepends=('zig')
source=("https://github.com/dnjulek/vapoursynth-zipcl/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('fe77340bcacc16cbe192bda1934072f0dde633864e5337071d4873aa1a87bea7')

build() {
	cd "vapoursynth-zipcl-${pkgver}"
	zig build -Doptimize=ReleaseFast
}

package() {
	cd "vapoursynth-zipcl-${pkgver}"
	_plugindir=$(python3 -c "import vapoursynth; print(vapoursynth.get_plugin_dir())")
	install -Dm755 zig-out/lib/libvszipcl.so "${pkgdir}${_plugindir}/libvszipcl.so"
	install -Dm644 README.md "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.md"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
