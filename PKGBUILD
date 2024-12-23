# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=python-babelfont
_pyname=${pkgname#python-}
pkgver=3.1.2
pkgrel=2
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
sha256sums=('ac640a7f3bcd9994f996df8fa9f1b4e3ce7c98e0bdf43098b660bef3473805b8')

build() {
	cd "$_archive"
	python -m build -wn
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
