# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Renato Caldas <renato dat calgera ot com>

pkgname=python-cfonts
pkgver=1.5.2
pkgrel=2
pkgdesc="Python port of cfonts"
arch=('any')
url="https://github.com/frostming/python-cfonts"
license=('MIT')
depends=('python-colorama')
makedepends=('python-pdm-pep517' 'python-build' 'python-install')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha512sums=('bbe2c9b6d4141f65ef3f93982fb7075a1ea70042f4213022ff89296bfb06c164922ea65c6828ab597fb662b0cab774eb9b84f97b55106d82def31ad2026a9dac')

build() {
	cd "$pkgname-$pkgver"
	python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
	cd "$pkgname-$pkgver"
	pytest -x
}

package() {
	export PYTHONHASHSEED=0
	cd "$pkgname-$pkgver"
	python -m install --optimize=1 --destdir="$pkgdir/" dist/*.whl
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
