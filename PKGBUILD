# Maintainer: Clemens Brunner <clemens dot brunner at gmail dot com>
pkgname=python-autoreject
_name=${pkgname#python-}
pkgver=0.4.4
pkgrel=1
pkgdesc="Python package for automatically rejecting bad trials and sensors in EEG/MEG data"
arch=('any')
url="https://autoreject.github.io/stable/index.html"
license=('BSD-3-Clause')
depends=(
    'python'
    'python-numpy'
    'python-scipy'
    'python-matplotlib'
    'python-scikit-learn'
    'python-joblib'
    'python-mne'
    'python-h5io'
    'python-pymatreader'
)
makedepends=('python-build' 'python-installer' 'python-hatchling' 'python-hatch-vcs')
source=(https://files.pythonhosted.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz)
sha256sums=('bd977ea3c88dc68550fbd5dbb98515b3b811907ba78afe8e412632edde6c8fc5')

build() {
    cd "$srcdir/$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
