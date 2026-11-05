# Maintainer: Clemens Brunner <clemens dot brunner at gmail dot com>
pkgname=python-autoreject
_name=${pkgname#python-}
pkgver=0.5.2
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
sha256sums=('b5ad629f9a644cb851ba90754cc33fd1b97e7a8b496f996357205c69fd06eb7f')

build() {
    cd "$srcdir/$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
