# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=python-collidoscope
_pyname=${pkgname#python-}
pkgver=0.4.1
pkgrel=1
pkgdesc='brute force detection of glyph collisions'
arch=(any)
url="https://github.com/simoncozens/$_pyname"
license=(MIT)
_pydeps=(beziers
         glyphtools
         fonttools
         uharfbuzz)
depends=(python
         "${_pydeps[@]/#/python-}")
makedepends=(python-{build,installer,wheel}
             python-setuptools)
_archive="$_pyname-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/$_pyname/$_archive.tar.gz")
sha256sums=('b7796d5d8981e04a2a652620d2063ef797d8fb3040c5383e574ae42f75537d1f')

build() {
	cd "$_archive"
	python -m build -wn
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
