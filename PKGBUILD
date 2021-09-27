# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Kuan-Yen Chou <kuanyenchou at gmail dot com>

pkgname=python-laspy
pkgdesc="Pythonic interface for .LAS LIDAR files"
url="https://github.com/laspy/laspy"
pkgver=2.0.3
_commit=4438f472de74e44df45309c84feb517f7538ed09
pkgrel=1
arch=('any')
license=('custom')
depends=('python-numpy')
makedepends=('git' 'python-setuptools' 'python-sphinx' 'python-sphinx_rtd_theme')
source=("$pkgname-$pkgver::git+$url#commit=$_commit?signed")
sha256sums=('SKIP')
validpgpkeys=('44B238524D21C5064D7081BD5022EF94BE848C51')

build() {
	cd "$pkgname-$pkgver"
	python setup.py build
	cd docs
	PYTHONPATH=../ make man
}

package() {
	cd "$pkgname-$pkgver"
	python setup.py install \
		--prefix=/usr \
		--root="$pkgdir" \
		--optimize=1 \
		--skip-build
	install -Dm 644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm 644 docs/_build/man/laspy.1 -t "$pkgdir/usr/share/man/man1/"
}
