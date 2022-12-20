# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=python-fontfeatures
_pyname=fontFeatures
pkgver=1.7.4
pkgrel=1
pkgdesc='Library for manipulating OpenType font features'
arch=(any)
url="https://github.com/simoncozens/$_pyname"
license=(MIT)
_pydeps=(beziers
          fs
          fonttools
          lxml)
depends=(python
         "${_pydeps[@]/#/python-}")
makedepends=(python-{build,installer}
             python-setuptools
             python-wheel)
optdepends=(python-glyphtools)
_archive="$_pyname-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/$_pyname/$_archive.tar.gz")
sha256sums=('b79547c03550ba9053a9e9858648700974d2cde00a0348088d66fb0528d3701c')

build() {
	cd "$_archive"
	python -m build -wn
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
