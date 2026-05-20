# Maintainer: TheFeelTrain <the@feeltra.in>

_plug=cranexpr
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=0.7.0.12.g687effd
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('x86_64')
url="https://github.com/sgt0/cranexpr"
license=('MIT')
depends=(
    'vapoursynth>=75'
)
makedepends=(
    'cargo'
)
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+${url}.git")
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
    _plugindir=$(python3 -c "import vapoursynth; print(vapoursynth.get_plugin_dir())")
    install -Dm755 "${_plug}/target/release/lib${_plug}.so" "${pkgdir}${_plugindir}/lib${_plug}.so"
    install -Dm644 "${_plug}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
