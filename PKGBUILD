# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pipname=pysilfont
pkgname=python-$_pipname
pkgver=1.5.0
pkgrel=6
pkgdesc='Python-based font utilities collection and framework'
arch=(any)
url="https://github.com/silnrsi/$_pipname"
license=(MIT)
_py_deps=(booleanoperations
          compreffor
          cu2qu
          defcon
          fontmath
          fontparts
          fonttools
          future
          glyphslib
          lz4
          mutatormath
          odfpy
          pyclipper
          ufo2ft
          ufolib2)
depends=(python
         "${_py_deps[@]/#/python-}")
makedepends=(python-{build,installer,wheel}
             python-setuptools)
optdepends=(fontbakery
            python-glyphconstruction
            python-palaso)
_archive="$_pipname-$pkgver"
source=("$_archive.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('04b81916d372a9300417715ffa3b9e259127babd9b78d69aecff1591942d913f')

build() {
	cd "$_archive"
	python -m build -wn
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
}
