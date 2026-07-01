# Maintainer: TheFeelTrain <the@feeltra.in>

_plug=awarp
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=3.1.0.g86d1d40
pkgrel=2
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('x86_64')
url='https://github.com/HolyWu/VapourSynth-AWarp'
license=('MIT')
depends=('vapoursynth')
makedepends=(
    'git'
    'meson-python'
)
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/HolyWu/VapourSynth-AWarp.git")
sha256sums=('SKIP')

pkgver() {
    cd "${_plug}"
    echo "$(git describe --long --tags | tr - . | tr -d r)"
}

build() {
    cd "${_plug}"
    python -m build --wheel --no-isolation
}

package(){
    cd "${_plug}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 README.md "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.md"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
