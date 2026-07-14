# Maintainer: Josh Holmer <jholmer.in@gmail.com>

_plug=hysteresis
pkgname=vapoursynth-plugin-${_plug}
pkgver=1.1.3
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug}"
arch=('any')
url='https://github.com/sgt0/vapoursynth-hysteresis'
license=('MIT')
depends=('vapoursynth')
makedepends=('cargo')
source=("${_plug}-${pkgver}.tar.gz::https://github.com/sgt0/vapoursynth-hysteresis/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('4dcc3543e84c444029c40522ceefee9e3955b676158590a318f8a3fc20612f6a')

build() {
	cd "vapoursynth-${_plug}-${pkgver}"
	cargo build --release
}

package() {
	cd "vapoursynth-${_plug}-${pkgver}"

	install -Dm644 target/release/libhysteresis.so "${pkgdir}/usr/lib/vapoursynth/libhysteresis.so"
	install -Dm644 README.md "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.md"
	install -Dm644 LICENSE.md "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/LICENSE.md"
}
