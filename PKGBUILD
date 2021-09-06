# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Renato Caldas <renato dat calgera ot com>

pkgname=python-cfonts
pkgver=1.5.2
pkgrel=1
pkgdesc="Python port of cfonts"
arch=('any')
url="https://github.com/frostming/python-cfonts"
license=('MIT')
depends=('python-colorama')
makedepends=('python-dephell' 'python-setuptools')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha512sums=('bbe2c9b6d4141f65ef3f93982fb7075a1ea70042f4213022ff89296bfb06c164922ea65c6828ab597fb662b0cab774eb9b84f97b55106d82def31ad2026a9dac')

prepare() {
	cd "$pkgname-$pkgver"
	dephell deps convert --from pyproject.toml --to setup.py
}

build() {
	cd "$pkgname-$pkgver"
	python setup.py build
}

check() {
	cd "$pkgname-$pkgver"
	pytest
}

package() {
	cd "$pkgname-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
