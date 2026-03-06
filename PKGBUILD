# Maintainer: Nocifer <apmichalopoulos at gmail dot com>

pkgname=vapoursynth-preview
pkgver=0.20.0
pkgrel=1
pkgdesc='Previewer for VapourSynth scripts (vs-preview)'
arch=('x86_64')
url='https://github.com/Jaded-Encoding-Thaumaturgy/vs-preview'
license=('Apache-2.0')
depends=('python-matplotlib' 'python-pyaml' 'python-pyqt6' 'python-pyqt6-sip' 'python-qdarkstyle' 'python-requests-toolbelt' 'python-vsjetengine' 'vapoursynth' 'vapoursynth-plugin-vsjetpack')
makedepends=('python-build' 'python-hatchling' 'python-installer' 'python-setuptools' 'python-versioningit' 'python-wheel')
source=("https://github.com/Jaded-Encoding-Thaumaturgy/vs-preview/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('af7db6ce73cbbceee591f72022eea6c7422f77b75b839c1ced7a7244afcba6c322859c2ce1fd1daf4d6d0a18f612aaf76c9ceeafe5169717dc21dfa66415594a')

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
