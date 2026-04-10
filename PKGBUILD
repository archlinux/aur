# Maintainer: Clemens Brunner <clemens dot brunner at gmail dot com>
pkgname=python-mne
_name=${pkgname#python-}
pkgver=1.12.0
pkgrel=2
pkgdesc="Python package for exploring, visualizing, and analyzing human neurophysiological data: MEG, EEG, sEEG, ECoG, and more"
arch=('any')
url="https://mne.tools/stable/index.html"
license=('BSD-3-Clause')
depends=(
    'python'
    'python-numpy'
    'python-scipy'
    'python-matplotlib'
    'python-pooch'
    'python-tqdm'
    'python-jinja'
    'python-decorator'
    'python-threadpoolctl'
    'python-lazy-loader'
)
makedepends=('python-build' 'python-installer' 'python-hatchling' 'python-hatch-vcs')
optdepends=('python-scikit-learn' 'python-pandas')
source=(https://files.pythonhosted.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz)
sha256sums=('29ff8331ba58626b5ce361dee66c0de5e331a0fd8217ac7543fb552ce667f522')

build() {
    cd "$srcdir/$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
