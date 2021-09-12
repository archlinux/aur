# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Robert Kubosz <kubosz.robert@gmail.com>

pkgname=python-abjad-ext-nauert
_name="${pkgname#python-}"
pkgver=3.4
pkgrel=1
pkgdesc="Abjad quantization extension, based on Paul Nauert's Q-Grids"
arch=('any')
url="https://github.com/abjad/abjad-ext-nauert"
license=('MIT')
groups=('abjad')
depends=("python-abjad=$pkgver")
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('0050b437498d4b2292dd36ae4d073a5aae786fa803c74f107201839a52fe86d0')

build() {
	cd "$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$_name-$pkgver"
	export PYTHONHASHSEED=0
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
