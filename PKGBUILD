# Maintainer: Nocifer <apmichalopoulos at gmail dot com>

pkgname=vapoursynth-preview
pkgver=0.19.1
pkgrel=1
pkgdesc='Previewer for VapourSynth scripts (vs-preview)'
arch=('x86_64')
url='https://github.com/Jaded-Encoding-Thaumaturgy/vs-preview'
license=('Apache-2.0')
depends=('python-matplotlib' 'python-pyaml' 'python-pyqt6' 'python-pyqt6-sip' 'python-qdarkstyle' 'python-requests-toolbelt' 'vapoursynth' 'vapoursynth-plugin-vsengine' 'vapoursynth-plugin-vsjetpack')
makedepends=('python-build' 'python-hatchling' 'python-installer' 'python-setuptools' 'python-versioningit' 'python-wheel')
source=("https://github.com/Jaded-Encoding-Thaumaturgy/vs-preview/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('00c8fad89553d5831723089190e708837966c709dc2bf4bb358c797764a5983d3d82e8ecde1b4b5b79ca5ffb52d8c7beea38ad1b38f918c34a7f14efdc12d649')

prepare() {
    cd vs-preview-${pkgver}

    sed -i -e "s|0.0.0+unknown|${pkgver}|g" pyproject.toml
}

build() {
    cd vs-preview-${pkgver}

    python -m build --wheel --no-isolation
}

package() {
    cd vs-preview-${pkgver}

    python -m installer --destdir="${pkgdir}" dist/*.whl
}
