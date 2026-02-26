# Maintainer: Clemens Brunner <clemens dot brunner at gmail dot com>
pkgname=python-mne-qt-browser
_name=$(printf '%s' "${pkgname#python-}" | tr '-' '_')
pkgver=0.7.4
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
sha256sums=('4ef6daaa1c25b6eda6eb370a571847dc950f05d4a97be4e49452428e8db5bbd2')

build() {
    cd "$srcdir/$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
