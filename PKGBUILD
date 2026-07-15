# Maintainer: TheFeelTrain <the@feeltra.in>

_plug=nnedi3vk
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=1.0.gd3aabea
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('x86_64')
url='https://github.com/HolyWu/VapourSynth-nnedi3vk'
license=('GPL-3.0')
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
source=("${_plug}::git+${url}.git")
sha256sums=('SKIP')

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
