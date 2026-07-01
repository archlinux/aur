# Maintainer: TheFeelTrain <the@feeltra.in>

_plug=dmetrics
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=R2.0.gf687ec5
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('x86_64')
url='https://github.com/vapoursynth/dmetrics'
license=('GPL-2.0')
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
source=("${_plug}::git+https://github.com/vapoursynth/dmetrics.git")
sha256sums=('SKIP')

pkgver() {
    cd "${_plug}"
    git describe --long --tags | tr - . | tr -d v
}

build() {
    cd "${_plug}"
    python -m build --wheel --no-isolation
}

package(){
    cd "${_plug}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 README.md "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.md"
    install -Dm644 Copying "${pkgdir}/usr/share/licenses/${pkgname}/Copying"
}
