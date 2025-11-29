# Maintainer: Nocifer <apmichalopoulos at gmail dot com>

pkgname=vapoursynth-preview
pkgver=0.18.1
pkgrel=1
pkgdesc='Previewer for VapourSynth scripts'
arch=('x86_64')
url='https://github.com/Jaded-Encoding-Thaumaturgy/vs-preview'
license=('Apache-2.0')
depends=('python-matplotlib' 'python-pyaml' 'python-pyqt6' 'python-pyqt6-sip' 'python-qdarkstyle' 'python-requests-toolbelt' 'vapoursynth>=R69' 'vapoursynth-plugin-vsengine' 'vapoursynth-plugin-vsjetpack')
makedepends=('python-build' 'python-hatchling' 'python-installer' 'python-setuptools' 'python-versioningit' 'python-wheel')
source=("https://github.com/Jaded-Encoding-Thaumaturgy/vs-preview/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('dbc0dd2fd8a7f9388d4983530dcf2852682dd2b33e03c0680fdbb3320eb1679f9b36f0b14c4bedcafce25f1a3e6db65be079787f1d3b9d9fe245fcf9e1138a00')

prepare() {
    sed -i -e "s|0.0.0+unknown|${pkgver}|g" vs-preview-"${pkgver}"/pyproject.toml
}

build() {
    cd vs-preview-${pkgver}

    python -m build --wheel --no-isolation
}

package() {
    cd vs-preview-${pkgver}

    python -m installer --destdir="${pkgdir}" dist/*.whl
}
