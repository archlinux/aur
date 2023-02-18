# Maintainer: Andrej Radović <r.andrej@gmail.com>
pkgname=python-inventree
_name=${pkgname#python-}
pkgver=0.10.0
pkgrel=1
pkgdesc="Python interface for InvenTree inventory management system"
url="https://github.com/inventree/inventree-python/"
depends=(
    'python'
    'python-requests'
)
makedepends=('python-setuptools')
license=('GPL3')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('cbd099b254168cb38eed5d614626d592d427fba43ffca1cc8e7bfcfadbb6f418')

build() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
    cd $pkgdir/usr/lib/python3*/site-packages/
    rm -rf scripts test
}
