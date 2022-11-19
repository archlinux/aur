# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Padraic Fanning <fanninpm AT miamioh DOT edu>

_name=flit_scm
pkgname=python38-${_name//_/-}
pkgver=1.7.0
pkgrel=2
pkgdesc='A PEP 518 backend using setuptools_scm to generate a version file, then flit to build'
arch=(any)
url="https://gitlab.com/WillDaSilva/$_name"
license=(MIT)
depends=(python38
         python38-flit-core
         python38-setuptools-scm
         python38-tomli)
makedepends=(python38-{build,installer,wheel})
_archive="$_name-$pkgver"
source=("$_archive.tar.gz::$url/-/archive/$pkgver/$_archive.tar.gz")
sha256sums=('05a267d77f6f8ca50a053786fe3c1a74f7222f2955292f2e6c03d2d064a141dc')

build() {
	cd "$_archive"
	export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver
	python3.8 -m build -wn
}

package() {
	cd "$_archive"
	export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver
	python3.8 -m installer -d "$pkgdir" dist/*.whl
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
