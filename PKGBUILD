# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=python-glyphtools
_pyname=${pkgname#python-}
pkgver=0.8.0
pkgrel=1
pkgdesc='Routines for extracting information from font glyphs'
arch=(any)
url="https://github.com/simoncozens/$_pyname"
license=(MIT)
_py_deps=(babelfont
          beziers
          babelfont
          glyphslib)
depends=(python
         "${_py_deps[@]/#/python-}")
makedepends=(python-{build,installer}
             python-setuptools
             python-wheel)
_archive="$_pyname-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/$_pyname/$_archive.tar.gz")
sha256sums=('3d7c171d63096ec8ba66d37e75a697027970de05790c5021c91c5d05aed43fe3')

build() {
	cd "$_archive"
	python -m build -wn
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
