# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=python-babelfont
_pyname=${pkgname#python-}
pkgver=3.0.1
pkgrel=1
pkgdesc='Interrogate and manipulate UFO, TTF and OTF fonts with a common interface'
arch=(any)
url="https://github.com/simoncozens/$_pyname"
license=(MIT)
_pydeps=(defcon
         fontparts
         fonttools)
depends=(python
         "${_pydeps[@]/#/python-}")
makedepends=(python-{build,installer,wheel}
             python-poetry-core)
_archive="$_pyname-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/$_pyname/$_archive.tar.gz")
sha256sums=('127973a37ede411e002a6f0d201d667e7324a4df177a576c62a54426351697a6')

build() {
	cd "$_archive"
	python -m build -wn
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
