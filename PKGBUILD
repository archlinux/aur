# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: jnanar <info@agayon.be>

pkgname=python-shortuuid
pkgver=1.0.8
pkgrel=1
pkgdesc='library that generates concise, unambiguous, URL-safe UUIDs'
arch=(any)
url="https://github.com/skorokithakis/${pkgname#python-}"
license=(BSD)
depends=(python)
options=(!emptydirs)
makedepends=(python-setuptools)
checkdepends=(python-django)
_archive="${pkgname#python-}-$pkgver"
source=("$_archive.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('7b62fa068d83fc5d09a4ba068d10d5709e42aa1f97a6d2cac40ac5143ce59421')
_setup='from setuptools import setup; setup();'

build() {
	cd "$_archive"
	python -c "$_setup" build
}

check() {
	cd "$_archive"
	python -c "$_setup" test
}

package() {
	cd "$_archive"
	python -c "$_setup" install --root="$pkgdir" --optimize=1 --skip-build
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" COPYING
}
