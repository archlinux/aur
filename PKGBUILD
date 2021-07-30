# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Aleksandar Trifunović <akstrfn at gmail dot com>

pkgname=python-plaster-pastedeploy
pkgver=0.7
pkgrel=2
pkgdesc="A loader interface around multiple config file formats."
arch=('any')
url="https://github.com/pylons/plaster_pastedeploy"
license=('MIT')
depends=('python-plaster>=0.5'
         'python-pastedeploy>=2.0')
makedepends=('python-setuptools')
checkdepends=('python-pytest-cov' 'python-pytest-runner')
changelog=CHANGES.rst
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/p/plaster_pastedeploy/plaster_pastedeploy-$pkgver.tar.gz"
        "$pkgname-$pkgver.tar.gz.asc::https://files.pythonhosted.org/packages/source/p/plaster_pastedeploy/plaster_pastedeploy-$pkgver.tar.gz.asc")
sha256sums=('391d93a4e1ff81fc3bae27508ebb765b61f1724ae6169f83577f06b6357be7fd'
            'SKIP')
validpgpkeys=('CC1A48C957AC6ABEF05B2C596BC977B056B829E5')

build(){
	cd "plaster_pastedeploy-$pkgver"
	python setup.py build
}

check(){
	cd "plaster_pastedeploy-$pkgver"
	python setup.py pytest -v
}

package(){
	cd "plaster_pastedeploy-$pkgver"
	python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1 --skip-build
	install -Dm 644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 README.rst -t "$pkgdir/usr/share/doc/$pkgname/"
}
