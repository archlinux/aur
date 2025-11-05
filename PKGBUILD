# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pipname=pysilfont
pkgname=python-$_pipname-git
pkgver=1.8.0.r169.gf4400b2
pkgrel=1
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
          glyphslib
          lz4
          mutatormath
          odfpy
          pyclipper
          ufo2ft
          ufolib2)
depends=('python'
         "${_py_deps[@]/#/python-}")
makedepends=(git
             python-{build,installer,wheel}
             python-setuptools)
optdepends=(fontbakery
            python-glyphconstruction
            python-palaso)
provides=("${pkgname%-git}=$pkgver")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	git describe --tags --abbrev=7 --match="v*" HEAD |
		sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$pkgname"
	python -m build -wn
}

package() {
	cd "$pkgname"
	python -m installer -d "$pkgdir" dist/*.whl
}
