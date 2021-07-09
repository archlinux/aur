# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Ralf Schmitt <ralf@systemexit.de>

pkgname=python2-greenlet
pkgver=1.1.0
pkgrel=1
pkgdesc="Lightweight in-process concurrent programming"
license=('MIT')
arch=('x86_64')
url="https://pypi.org/project/greenlet/"
depends=('python2')
makedepends=('python2-setuptools')
source=("https://files.pythonhosted.org/packages/source/g/greenlet/greenlet-${pkgver}.tar.gz")
sha512sums=('13547917860d9a19f2fab519380121805d8f7801ad47b1584003833a5de66eb703373c71e67b32f13b770d429bcee6856b35bc6fc8afb7be598c2bf509bede03')

build() {
	cd "$srcdir"/greenlet-$pkgver
	python2 setup.py build
}

check() {
	cd "$srcdir"/greenlet-$pkgver
	PYTHONPATH="$PWD/build/lib.linux-$CARCH-2.7" python2 -m unittest discover -v greenlet.tests
}

package() {
	cd greenlet-$pkgver
	python2 setup.py install -O1 --root="$pkgdir" --skip-build
	install -Dm0644 LICENSE.PSF "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.PSF
}

