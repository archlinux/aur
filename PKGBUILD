# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=python-grandalf
_pkgname=${pkgname#python-}
pkgver=0.7
pkgrel=3
pkgdesc='graph and drawing algorithms framework'
arch=(any)
url="https://github.com/bdcht/$_pkgname"
license=(MIT)
depends=(python
         python-ply)
makedepends=(python-setuptools)
checkdepends=(python-pytest
              python-pytest-runner)
_archive="$_pkgname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('b3112299fe0a9123c088a16bf2f1b541d0d91199b77170a9739b569bd16a828e')

build() {
	cd "$_archive"
	python setup.py build
}

check() {
	cd "$_archive"
	python setup.py pytest
}

package() {
	cd "$_archive"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
