# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=python-babelfont
_pyname=${pkgname#python-}
pkgver=3.1.3
pkgrel=1
pkgdesc='Interrogate and manipulate UFO, TTF and OTF fonts with a common interface'
arch=(any)
url="https://github.com/simoncozens/$_pyname"
license=(MIT)
_pydeps=(defcon
         fontparts
         orjson
         fonttools)
depends=(python
         "${_pydeps[@]/#/python-}")
makedepends=(python-{build,installer,wheel}
             python-setuptools-scm)
_archive="$_pyname-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/$_pyname/$_archive.tar.gz")
sha256sums=('23f7b17c02eb62df55ed0e74391768ea16fc262283ede2a7e7b4bf96c91378df')

build() {
	cd "$_archive"
	python -m build -wn
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
