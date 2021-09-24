# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Ralf Schmitt <ralf@systemexit.de>

pkgname=python2-greenlet
pkgver=1.1.1
pkgrel=1
pkgdesc="Lightweight in-process concurrent programming"
license=('MIT')
arch=('x86_64')
url="https://pypi.org/project/greenlet/"
depends=('python2')
makedepends=('python2-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/g/greenlet/greenlet-$pkgver.tar.gz")
sha512sums=('156ad7dfcb73764818d5f6176b5c80dc5a3ac532db5af5ffe654033a5e336d35a9e9edadb3b37fa9bf5fc338f706baf3693dcfb550598d8f17f042f5a27b86f9')

build() {
	cd "greenlet-$pkgver"
	python2 setup.py build
}

check() {
	cd "greenlet-$pkgver"
	PYTHONPATH="$PWD/build/lib.linux-$CARCH-2.7" python2 -m unittest discover -v greenlet.tests
}

package() {
	cd "$srcdir"/greenlet-$pkgver
	PYTHONHASHSEED=0 python2 setup.py install -O1 --root="$pkgdir" --skip-build
	install -Dm0644 LICENSE.PSF "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.PSF
}
