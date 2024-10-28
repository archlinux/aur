# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname='python-pygam'
_pkgname='pygam'
pkgver='0.9.1'
pkgrel=1
pkgdesc="Generalized Additive Models in Python"
url="https://pygam.readthedocs.io"
checkdepends=('python-pytest')
depends=('python' 'python-numpy' 'python-progressbar' 'python-scipy')
makedepends=('python-setuptools')
optdepends=('python-scikit-sparse')
license=('Apache-2.0')
arch=('any')
source=("https://pypi.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz"
https://patch-diff.githubusercontent.com/raw/dswah/pyGAM/pull/288.patch
scipy.patch)
sha256sums=('a321a017bf485ed93fc6233e02621f8e7eab3d4f8971371c9ae9e079c55be01d'
            '98856f53a8dc4f332f2db61f0bbebd8a34df76f024a64f6a722f3530dd31a686'
            '360aafbbeb2dcad4ef4abd4fe9ab72d03e7ff6ac639317cc8bb7bd813bab8dc9')

prepare() {
    cd "$_pkgname-$pkgver"
    patch -p1 < ../288.patch
    patch -p1 < ../scipy.patch
}

#check() {
    #cd "$srcdir/$_pkgname-$pkgver"
    #pytest
#}

build() {
    cd "${_pkgname}-${pkgver}"
    python -m build -wn
}
package() {
    cd "${_pkgname}-${pkgver}"
    python -m installer --dest="${pkgdir}" dist/*.whl
}
