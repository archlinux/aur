# Maintainer: TheFeelTrain <the@feeltra.in>
# Contributor: Josh Holmer <jholmer.in@gmail.com>

_plug=hysteresis
pkgname=vapoursynth-plugin-${_plug}
pkgver=1.2.0
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug}"
arch=('any')
url='https://github.com/sgt0/vapoursynth-hysteresis'
license=('MIT')
depends=('vapoursynth')
makedepends=('cargo')
source=("${_plug}-${pkgver}.tar.gz::https://github.com/sgt0/vapoursynth-hysteresis/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('e46ba0a53fe3815662930e705062df63083fee9ea4435647bd38a665c6cfc5d9')

build() {
	cd "vapoursynth-${_plug}-${pkgver}"
	cargo build --release
}

package() {
	cd "vapoursynth-${_plug}-${pkgver}"
	_plugindir=$(python3 -c "import vapoursynth; print(vapoursynth.get_plugin_dir())")
	install -Dm644 target/release/libhysteresis.so "${pkgdir}${_plugindir}/libhysteresis.so"
	install -Dm644 README.md "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.md"
	install -Dm644 LICENSE.md "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/LICENSE.md"
}