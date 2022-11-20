# Maintainer: Caleb Maclennana <caleb@alerque.com>

pkgname=python38-pytest-param-files
_pyname=${pkgname#python38-}
pkgver=0.3.4
pkgrel=2
pkgdesc='Create pytest parametrize decorators from external files '
arch=(any)
url="https://github.com/chrisjsewell/$_pyname"
license=(MIT)
depends=(python38
         python38-pytest)
makedepends=(python38-{build,installer,wheel}
             python38-flit-core)
# _archive="$_pyname-$pkgver"
# source=("$url/archive/v$pkgver/$_archive.tar.gz")
_archive="${_pyname//-/_}-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/$_pyname/$_archive.tar.gz")
sha256sums=('6c0c324f9d91bd16a5d63ab5bb78bd2d19ca5c6f2b68b6acbc4ae61fb1b6893d')

build() {
	cd "$_archive"
	python3.8 -m build -wn
}

check() {
	cd "$_archive"
	# pytest
}

package() {
	cd "$_archive"
	python3.8 -m installer -d "$pkgdir" dist/*.whl
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
