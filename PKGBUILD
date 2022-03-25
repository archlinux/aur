# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=python-fontfeatures
_pyname=fontFeatures
pkgver=1.6.4
pkgrel=1
pkgdesc='Library for manipulating OpenType font features'
arch=(any)
url="https://github.com/simoncozens/$_pyname"
license=(MIT)
_py_deps=(beziers
          glyphtools
          fs
          fonttools
          lxml)
depends=(python
         "${_py_deps[@]/#/python-}")
makedepends=(python-{build,installer}
             python-setuptools
             python-wheel)
_archive="$_pyname-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/$_pyname/$_archive.tar.gz")
sha256sums=('334f2281f76ac3d3305a416e6b8acf52110812c81051dac388b66e4f5b3e711c')

build() {
	cd "$_archive"
	python -m build -wn
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
