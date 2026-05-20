# Maintainer: Clemens Brunner <clemens dot brunner at gmail dot com>
pkgname=python-mne-qt-browser
_name=$(printf '%s' "${pkgname#python-}" | tr '-' '_')
pkgver=0.7.5
pkgrel=1
pkgdesc="Alternative backend for plotting with MNE-Python"
arch=('any')
url="https://mne.tools/stable/index.html"
license=('BSD-3-Clause')
depends=(
    'python'
    'python-numpy'
    'python-scipy'
    'python-matplotlib'
    'python-qtpy'
    'python-scooby'
    'python-mne'
    'python-pyqtgraph'
    'python-packaging'
    'python-darkdetect'
    'python-qdarkstyle'
)
makedepends=('python-build' 'python-installer' 'python-hatchling' 'python-hatch-vcs')
source=(https://files.pythonhosted.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz)
sha256sums=('2a7fcf892f9fa31b8a678f600d946dc3090d2c1576aa3643851f0c97d98dd269')

build() {
    cd "$srcdir/$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
