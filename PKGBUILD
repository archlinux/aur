# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Mathijs Kadijk <maccain13@gmail.com>

pkgname=python-azkaban
pkgver=0.9.14
pkgrel=1
pkgdesc="Lightweight Azkaban client"
arch=('any')
url="https://github.com/mtth/azkaban"
license=('MIT')
depends=(
	'python-six>=1.6.1'
	'python-docopt'
	'python-requests>=2.4.0'
	'python-urllib3')
makedepends=('python-setuptools' 'git')
checkdepends=('python-nose')
changelog=CHANGES
source=("$pkgname-$pkgver::git+$url#tag=$pkgver?signed")
sha256sums=('SKIP')
validpgpkeys=('5E58F75A5DA44C4BCD6713A07800266DA107476A')

build() {
	cd "$pkgname-$pkgver"
	python setup.py build
}

check() {
	cd "$pkgname-$pkgver"
	python setup.py nosetests
}

package() {
	cd "$pkgname-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 README.md AUTHORS -t "$pkgdir/usr/share/doc/$pkgname/"
	find doc -type f -exec install -Dm 644 -t "$pkgdir/usr/share/doc/$pkgname/" '{}' \+
}
