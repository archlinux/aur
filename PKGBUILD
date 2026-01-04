# Maintainer: Nocifer <apmichalopoulos at gmail dot com>

pkgname=vapoursynth-preview
pkgver=0.18.2
pkgrel=2
pkgdesc='Previewer for VapourSynth scripts (vs-preview)'
arch=('x86_64')
url='https://github.com/Jaded-Encoding-Thaumaturgy/vs-preview'
license=('Apache-2.0')
depends=('python-matplotlib' 'python-pyaml' 'python-pyqt6' 'python-pyqt6-sip' 'python-qdarkstyle' 'python-requests-toolbelt' 'vapoursynth>=R69' 'vapoursynth-plugin-vsengine' 'vapoursynth-plugin-vsjetpack')
makedepends=('python-build' 'python-hatchling' 'python-installer' 'python-setuptools' 'python-versioningit' 'python-wheel')
source=("https://github.com/Jaded-Encoding-Thaumaturgy/vs-preview/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('92c5d4c791117bb205ecb6cf1668acb98b18ed1a1f1d6ac5083289c26c5a2906c32a61070108c4c7e779530225d8e64001bf7444654ac2f995106fff0dc04e23')

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
