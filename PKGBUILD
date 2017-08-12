# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname=('python-ng-numpy-randomstate')
_module='ng-numpy-randomstate'
pkgver='1.13.2'
pkgrel=1
pkgdesc="Numpy compatible random number generators."
url="https://bashtage.github.io/ng-numpy-randomstate"
depends=('python' 'python-numpy')
makedepends=(
    'cython'
    'python-setuptools')
license=('custom:University of Illinois/NCSA Open Source License')
arch=('i686' 'x86_64')
source=("https://github.com/bashtage/ng-numpy-randomstate/archive/${pkgver}.tar.gz"
    "fix_setup.patch")
sha256sums=('0d1b1838a055b930f42fe686bc0f19def79ddbe6cb564efea9e5ff64b3b6c5b5'
            '63e6b63c3ac53b15404d33f585b59825f8375a67d9e5fd4be82f3a246caaba84')

prepare() {
    cd "$srcdir/$_module-$pkgver"
    patch -p1 <../../fix_setup.patch
}

check() {
    cd "$srcdir/$_module-$pkgver"
    python setup.py build_ext --inplace
    pytest
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 clean
    install -D -m644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
