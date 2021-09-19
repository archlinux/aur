# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=python-country_list
pkgver=1.0.0
pkgrel=1
pkgdesc="List of all countries with names and ISO 3166-1 codes in all languages and data formats"
arch=('any')
url="https://github.com/bulv1ne/country_list"
license=('MIT')
depends=('python')
makedepends=('python-setuptools' 'git')
source=("$pkgname-$pkgver::git+$url#tag=v$pkgver")
sha256sums=('SKIP')

prepare() {
	cd "$pkgname-$pkgver"
	git submodule update --init
}

build() {
	cd "$pkgname-$pkgver"
	python setup.py build
}

check() {
	cd "$pkgname-$pkgver"
	python -m unittest tests.py
}

package() {
	cd "$pkgname-$pkgver"
	PYTHONHASHSEED=0 python setup.py install --root="$pkgdir" --optimize=1 --skip-build
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 README.rst -t "$pkgdir/usr/share/doc/$pkgname/"
}
