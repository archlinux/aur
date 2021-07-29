# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Aleksandar Trifunović <akstrfn at gmail dot com>
# Contributor: Chih-Hsuan Yen <yan12125 at gmail dot com>

pkgname=python-plaster
pkgver=1.0
pkgrel=4
pkgdesc="A loader interface around multiple config file formats."
arch=('any')
url="https://github.com/pylons/plaster"
license=('MIT')
depends=('python>=3.4')
makedepends=('python-setuptools')
checkdepends=('python-pytest-runner')
changelog=CHANGES.rst
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/p/plaster/plaster-$pkgver.tar.gz"
        "$pkgname-$pkgver.tar.gz.asc::https://files.pythonhosted.org/packages/source/p/plaster/plaster-$pkgver.tar.gz.asc")
sha256sums=('8351c7c7efdf33084c1de88dd0f422cbe7342534537b553c49b857b12d98c8c3'
            'SKIP')
validpgpkeys=('CC1A48C957AC6ABEF05B2C596BC977B056B829E5')

build(){
	cd "plaster-$pkgver"
	python setup.py build
}

check(){
	cd "plaster-$pkgver"
	python setup.py pytest -v
}

package(){
	cd "plaster-$pkgver"
	python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1 --skip-build
	install -Dm 644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 README.rst -t "$pkgdir/usr/share/doc/$pkgname/"
}
