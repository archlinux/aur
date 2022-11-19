# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Padraic Fanning <fanninpm AT miamioh DOT edu>

pkgname=python38-exceptiongroup
_pyname=${pkgname#python-}
pkgver=1.0.4
pkgrel=1
pkgdesc='Backport of PEP 654 (exception groups)'
arch=(any)
url="https://github.com/agronholm/$_pyname"
license=(MIT)
depends=(python38)
makedepends=(python38-{build,installer,wheel}
             python38-flit-scm)
checkdepends=(python38-pytest)
_archive="$_pyname-$pkgver"
source=("$url/archive/$pkgver/$_archive.tar.gz")
sha256sums=('69e8a2ddd1b03175ca2c43f474bb1e7eb5074afadf73e63e9c905cdee1a82a6b')

build() {
	cd "$_archive"
	export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver
	python3.8 -m build -wn
}

check() {
	cd "$_archive"
	PYTHONPATH=src pytest
}

package() {
	cd "$_archive"
	export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver
	python3.8 -m installer -d "$pkgdir" dist/*.whl
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
