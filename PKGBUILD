# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=python-collidoscope
_pyname=${pkgname#python-}
pkgver=0.6.5
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
sha256sums=('0fb33327c1598c0fcd4970aa08943d6b4d853cf8b7b785b4abae704480dc7d20')

build() {
	cd "$_archive"
	python -m build -wn
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
