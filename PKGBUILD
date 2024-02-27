# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=python-fontfeatures
_pyname=fontFeatures
pkgver=1.8.0
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
makedepends=(python-{build,installer,wheel}
             python-setuptools)
optdepends=(python-glyphtools)
_archive="$_pyname-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/$_pyname/$_archive.tar.gz")
sha256sums=('5cb243f752325148de4aa7615857c8aaff722123dc6d4e1b811bd71134873a26')

build() {
	cd "$_archive"
	python -m build -wn
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
