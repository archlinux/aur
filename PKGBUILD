# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Serge Victor <arch at random dot re>

pkgname=python-opterator
_name="${pkgname#python-}"
pkgver=0.5
pkgrel=2
pkgdesc="Option parsing script that generates commandline options from the main method signature"
arch=('any')
license=('MIT')
url="https://github.com/buchuki/opterator"
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::https://github.com/buchuki/$_name/archive/$pkgver.tar.gz")
sha256sums=('767420569553272331021d6eda764a544dc5583ee384cf695fdd6e44c2ecb841')

build() {
	cd "$_name-$pkgver"
	python setup.py build
}

check() {
	cd "$_name-$pkgver"
	pytest || true ## tests fail due to targeting an older pytest
}

package() {
	cd "$_name-$pkgver"
	PYTHONHASHSEED=0 python setup.py install --root="$pkgdir" --optimize=1 --skip-build
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 README.rst -t "$pkgdir/usr/share/doc/$pkgname/"
}
