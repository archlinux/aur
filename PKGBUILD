# Maintainer: TheFeelTrain <the@feeltra.in>

_plug=edgemasks
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=4.1.0.gfeb47b4
pkgrel=2
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('x86_64')
url='https://github.com/HolyWu/VapourSynth-EdgeMasks'
license=('MIT')
depends=('vapoursynth')
makedepends=(
    'git'
    'meson-python'
    'python-build'
    'python-installer'
    'python-wheel'
)
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/HolyWu/VapourSynth-EdgeMasks.git")
sha256sums=('SKIP')
options=('debug')

pkgver() {
    cd "${_plug}"
    git describe --long --tags | tr - . | tr -d r
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
