# Maintainer: Nocifer <apmichalopoulos at gmail dot com>

pkgname=vapoursynth-preview
pkgver=0.18.0
pkgrel=1
pkgdesc='Previewer for VapourSynth scripts'
arch=('x86_64')
url='https://github.com/Jaded-Encoding-Thaumaturgy/vs-preview'
license=('Apache-2.0')
depends=('python-matplotlib' 'python-pyaml' 'python-pyqt6' 'python-pyqt6-sip' 'python-qdarkstyle' 'python-requests-toolbelt' 'vapoursynth>=R69' 'vapoursynth-plugin-vsengine' 'vapoursynth-plugin-vsjetpack')
makedepends=('python-build' 'python-hatchling' 'python-installer' 'python-setuptools' 'python-versioningit' 'python-wheel')
source=("https://github.com/Jaded-Encoding-Thaumaturgy/vs-preview/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('ac6e8ad15f44e76a02dd6c5ce7a626afc3aad49d1e4f9000d9d47ec00dd525f6cc9b45aba3f57baff148839114ac84f00a9be37085b63719159452ce33cbca03')

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
