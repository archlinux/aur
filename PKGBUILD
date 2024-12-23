# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pipname=glyphconstruction
_project=GlyphConstruction
pkgname=python-$_pipname
pkgver=0.8.4
pkgrel=5
pkgdesc='a simple, powerful, human-readable language for describing how glyph shapes are built'
arch=(any)
url="https://github.com/typemytype/$_project"
license=(MIT)
depends=(python)
makedepends=(python-{build,installer,wheel}
             python-setuptools)
_archive="$_project-$pkgver"
source=("$url/archive/$pkgver/$_archive.tar.gz")
sha256sums=('d280a6296cc3bc1ee8c9251f03b73c7fa88fb948e89bf6b30f26ca24a9837d7c')

prepare() {
	cd "$_archive"
	sed -i -e 's!lib/glyph!Lib/glyph!' setup.py
}

build() {
	cd "$_archive"
	python -m build -wn
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
}
