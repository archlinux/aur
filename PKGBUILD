# Maintainer: Josh Holmer <jholmer.in@gmail.com>

_plug=vsmuxtools
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=0.1.0.1.g1f1d8cf
pkgrel=2
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('any')
url='https://github.com/Jaded-Encoding-Thaumaturgy/vs-muxtools'
license=('MIT')
depends=(
    'vapoursynth'
    'vapoursynth-plugin-vstools-git'
    'python-numpy'
    'python-muxtools'
)
makedepends=(
    'git'
    'python-build'
    'python-wheel'
    'python-installer'
    'python-setuptools'
)
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/Jaded-Encoding-Thaumaturgy/vs-muxtools.git")
sha256sums=('SKIP')

pkgver() {
    cd "${_plug}"
    echo "$(git describe --long --tags | tr - . | tr -d v)"
}

build() {
    cd "${_plug}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_plug}"
    python -m installer --destdir="${pkgdir}" dist/*.whl

    install -Dm644 README.md "${pkgdir}/usr/share/doc/vapoursynth/tools/${_plug}/README.md"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
