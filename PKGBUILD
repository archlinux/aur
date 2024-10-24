# Maintainer: Lev Levitsky <levlev at mail dot ru>
pkgname=python-pyteomics
_name=${pkgname#python-}
pkgver=4.7.5
pkgrel=1
pkgdesc="A framework for proteomics data analysis."
arch=('any')
url="https://pyteomics.readthedocs.io"
license=('Apache')
depends=('python')
makedepends=(python-build python-installer)
optdepends=('python-matplotlib: for pylab_aux module'
            'python-sqlalchemy: for mass.unimod module'
            'python-pandas: for convenient filtering of CSV tables from search engines'
            'python-lxml: for XML parsing modules'
            'python-numpy: for most of features, highly recommended'
            'python-dill: needed for multiprocessing when pickle is not enough'
            'python-pynumpress: for Numpress support')
options=(!emptydirs)
source=("https://pypi.debian.net/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('382aeaa8b921bdd2a7e5b4aa9fe46c6184bb43701205a845b4b861ee3e88f46a')
changelog=CHANGELOG

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:
