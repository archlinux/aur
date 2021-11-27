# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Ralf Schmitt <ralf@systemexit.de>

pkgname=python2-greenlet
pkgver=1.1.2
pkgrel=1
pkgdesc="Lightweight in-process concurrent programming"
license=('MIT' 'PSF')
arch=('x86_64')
url="https://pypi.org/project/greenlet/"
depends=('python2')
makedepends=('python2-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/g/greenlet/greenlet-$pkgver.tar.gz")
sha512sums=('e7bcc1bfffc80fcaee735ee69f6f53e8f68bd4d3ab8ad6ed813684ffad72340a347e4810f18cc32d9c3948b5c995aefc3a53ce4ae60324093dae12042d33183b')

build() {
	cd "greenlet-$pkgver"
	python2 setup.py build
}

check() {
	cd "greenlet-$pkgver"
	PYTHONPATH="$PWD/build/lib.linux-$CARCH-2.7" python2 -m unittest discover -v greenlet.tests
}

package() {
	cd "greenlet-$pkgver"
	PYTHONHASHSEED=0 python2 setup.py install -O1 --root="$pkgdir" --skip-build
	install -Dm644 LICENSE LICENSE.PSF -t "$pkgdir/usr/share/licenses/$pkgname/"
}
