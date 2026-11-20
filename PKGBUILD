# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=python-fontfeatures
_pyname=fontFeatures
pkgver=1.10.2
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
             python-setuptools-scm)
optdepends=(python-glyphtools)
_archive="${_pyname,,}-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/$_pyname/$_archive.tar.gz")
sha256sums=('402e33962f8c9145e6954bd747c2620a277d437a6eaf3966634dc45d1d7fb7c1')

build() {
	cd "$_archive"
	python -m build -wn
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
