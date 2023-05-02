# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: jnanar <info@agayon.be>

pkgname=python-shortuuid
_pkgname=${pkgname#python-}
pkgver=1.0.11
pkgrel=1
pkgdesc='library that generates concise, unambiguous, URL-safe UUIDs'
arch=(any)
url="https://github.com/skorokithakis/$_pkgname"
license=(BSD)
depends=(python)
options=(!emptydirs)
makedepends=(python-{build,installer,wheel}
             python-poetry-core)
checkdepends=(python-django)
_archive="$_pkgname-$pkgver"
source=("$_archive.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('6ba28eece88d23389684585d73f3d883be3a76d6ab0c5d18ef34e5de2d500d0f')

build() {
	cd "$_archive"
	python -m build -wn
}

check() {
	cd "$_archive"
	python -m unittest discover
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" COPYING
}
