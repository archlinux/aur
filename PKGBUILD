# Maintainer: TheFeelTrain <the@feeltra.in>

_plug=fftspectrum-rs
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=1.0.11.29.g48d96fe
pkgrel=2
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('x86_64')
url="https://github.com/sgt0/vapoursynth-fftspectrum-rs"
license=('MIT')
depends=(
    'vapoursynth'
)
makedepends=(
    'cargo'
)
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/sgt0/vapoursynth-fftspectrum-rs.git")
sha256sums=('SKIP')
options=('debug')

pkgver() {
    cd "${_plug}"
    git describe --long --tags | tr - . | tr -d v
}

build() {
    cd "${_plug}"
    cargo build --release
}

package(){
    install -Dm755 "${_plug}/target/release/libfftspectrum_rs.so" "${pkgdir}/usr/lib/vapoursynth/libfftspectrum_rs.so"
    install -Dm644 "${_plug}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
