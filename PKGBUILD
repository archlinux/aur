# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: jnanar <info@agayon.be>

pkgname=python-shortuuid
pkgver=1.0.0
pkgrel=3
pkgdesc='library that generates concise, unambiguous, URL-safe UUIDs'
arch=(any)
url="https://github.com/skorokithakis/${pkgname#python-}"
license=(BSD)
depends=(python)
options=(!emptydirs)
makedepends=(python-setuptools)
_archive="${pkgname#python-}-$pkgver"
source=("$_archive.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('cc2539aaed1b4de34853ee4aaf8331176b768a2d3a87d5a790453e082ce36850')

build() {
	cd "$_archive"
	python setup.py build
}

check() {
	cd "$_archive"
	python setup.py test
}

package() {
	cd "$_archive"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" COPYING
}
