# Maintainer: Josh Holmer <jholmer.in@gmail.com>

_plug=muxtools
pkgname=python-${_plug}-git
pkgver=0.1.0.7.g4b1ca0d
pkgrel=3
pkgdesc="Python Package: ${_plug} (GIT version)"
arch=('any')
url='https://github.com/Jaded-Encoding-Thaumaturgy/muxtools'
license=('MIT')
depends=(
    'python-requests'
    # 'python-fontcollector' # package doesn't exist
    'python-ass'
    'python-wget'
    'python-py7zr'
    'python-pymediainfo'
    'python-rich'
    'python-pyparsebluray-git'
    'python-pydantic'
    'python-videotimestamps'
)
makedepends=(
    'git'
    'python-build'
    'python-wheel'
    'python-installer'
    'python-setuptools'
)
provides=("python-${_plug}")
conflicts=("python-${_plug}")
source=("${_plug}::git+https://github.com/Jaded-Encoding-Thaumaturgy/muxtools.git")
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

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
