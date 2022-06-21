# Maintainer: Andrej Radović <r.andrej@gmail.com>
pkgname=python-inventree
_name=${pkgname#python-}
pkgver=0.7.1
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
sha256sums=('218dd112c325764d4027de509d8cf466fc2a6a16a1bba297ee71687c6a8378dd')

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
