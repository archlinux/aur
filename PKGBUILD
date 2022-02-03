# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Aleksandar Trifunović <akstrfn at gmail dot com>

pkgname=python-plaster-pastedeploy
pkgver=0.7
pkgrel=3
pkgdesc="A loader interface around multiple config file formats."
arch=('any')
url="https://github.com/pylons/plaster_pastedeploy"
license=('MIT')
depends=('python-plaster' 'python-pastedeploy')
makedepends=('python-setuptools' 'python-build' 'python-install' 'python-wheel')
checkdepends=('python-pytest')
changelog=CHANGES.rst
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/p/plaster_pastedeploy/plaster_pastedeploy-$pkgver.tar.gz"
        "$pkgname-$pkgver.tar.gz.asc::https://files.pythonhosted.org/packages/source/p/plaster_pastedeploy/plaster_pastedeploy-$pkgver.tar.gz.asc")
sha256sums=('391d93a4e1ff81fc3bae27508ebb765b61f1724ae6169f83577f06b6357be7fd'
            'SKIP')
validpgpkeys=('CC1A48C957AC6ABEF05B2C596BC977B056B829E5')

build(){
	cd "plaster_pastedeploy-$pkgver"
	python -m build --wheel --skip-dependency-check --no-isolation
}

check(){
	cd "plaster_pastedeploy-$pkgver"
	PYTHONPATH=./src pytest -x
}

package(){
	export PYTHONHASHSEED=0
	cd "plaster_pastedeploy-$pkgver"
	python -m install --optimize=1 --destdir="$pkgdir/" dist/*.whl
	install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 README.rst -t "$pkgdir/usr/share/doc/$pkgname/"
}
