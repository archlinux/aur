# Maintainer: TheFeelTrain <the@feeltra.in>
# Contributor: Josh Holmer <jholmer.in@gmail.com>

_plug=hysteresis
pkgname=vapoursynth-plugin-${_plug}
pkgver=1.5.0
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug}"
arch=('any')
url='https://github.com/sgt0/vapoursynth-hysteresis'
license=('MIT')
depends=('vapoursynth')
makedepends=('cargo')
source=("${_plug}-${pkgver}.tar.gz::https://github.com/sgt0/vapoursynth-hysteresis/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('41d6d51bee80e338966589aea373a2723e7f97e2583aafdb0a00facbac51e066')

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
