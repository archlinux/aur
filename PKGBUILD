# Maintainer: Clemens Brunner <clemens dot brunner at gmail dot com>
pkgname=python-autoreject
_name=${pkgname#python-}
pkgver=0.5.0
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
sha256sums=('948adfc4e65c156bb6731cbaf820ce6ff899e9fd4d4c3182ccd27ac9faa7a1cd')

build() {
    cd "$srcdir/$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
