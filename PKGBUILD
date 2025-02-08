# Maintainer: Andrej Radović <r.andrej@gmail.com>
pkgname=python-inventree
_name=${pkgname#python-}
pkgver=0.17.4
pkgrel=1
pkgdesc="Python interface for InvenTree inventory management system"
url="https://github.com/inventree/inventree-python/"
depends=(
    'python'
    'python-requests'
)
makedepends=(python-build python-installer python-wheel python-setuptools)
license=('GPL3')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('a385e377b32d639011a689b413390c9c71168c2c301a729500d17e5064499c18')

build() {
	cd "$srcdir/$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
	cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    cd $pkgdir/usr/lib/python3*/site-packages/
    rm -rf scripts test
}
