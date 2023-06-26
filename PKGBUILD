# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=python-beziers
_pyname=${pkgname#python-}.py
pkgver=0.5.0
pkgrel=1
pkgdesc='Routines for extracting information from font glyphs'
arch=(any)
url="https://github.com/simoncozens/$_pyname"
license=(MIT)
depends=(python)
makedepends=(python-{build,installer,wheel}
             python-setuptools)
_archive="$_pyname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
# source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/$_pyname/$_archive.tar.gz")
sha256sums=('96ab69ad1f98a4f6f1f251b255f2473c3408a80983f9c82ddf3a6e3f67fa58b4')

build() {
	cd "$_archive"
	python -m build -wn
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
