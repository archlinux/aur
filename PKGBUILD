# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: jnanar <info@agayon.be>

pkgname=python-shortuuid
_pkgname=${pkgname#python-}
pkgver=1.0.13
pkgrel=3
pkgdesc='library that generates concise, unambiguous, URL-safe UUIDs'
arch=(any)
url="https://github.com/skorokithakis/$_pkgname"
license=(BSD-3-Clause)
depends=(python)
options=(!emptydirs)
makedepends=(python-{build,installer,wheel}
             python-poetry-core)
checkdepends=(python-django
              python-pytest)
_archive="$_pkgname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('2ac98d9ff16cac764d1f2e98cde146bce436714e6a6c74ec42c24a63c210ce1d')

build() {
	cd "$_archive"
	python -m build -wn
}

check() {
	cd "$_archive"
	pytest
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" COPYING
}
