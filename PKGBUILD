# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=python-grandalf
_pkgname=${pkgname#python-}
pkgver=0.8
pkgrel=3
pkgdesc='graph and drawing algorithms framework'
arch=(any)
url="https://github.com/bdcht/$_pkgname"
license=(MIT)
depends=(python
         python-ply)
makedepends=(python-{build,installer,wheel}
             python-setuptools)
checkdepends=(python-pytest
              python-pytest)
_archive="$_pkgname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('82d80072e5a1928bc46d94a54d2d92a38f73da0af052efc84ce34b5f4601dfa2')

prepare() {
	cd "$_archive"
	sed -i -e '/setup_requires/d' setup.py
}

build() {
	cd "$_archive"
	python -m build -wn
}

check() {
	cd "$_archive"
	export PYTHONPATH="$PWD/build/lib"
	pytest
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
