# Maintainer: AkechiShiro <akechishiro-aur at lahfa dot xyz>

_pyname=openstep-parser
pkgname=python-${_pyname}-git
pkgver=1.5.3.r16.ga62840b
pkgrel=1
pkgdesc='OpenStep plist parser and writer written in Cython'
arch=(x86_64)
url="https://github.com/kronenthaler/$_pyname"
license=(BSD)
depends=(python)
conflicts=(python-openstep-plist python-openstep-parser)
provides=(python-openstep-parser)
makedepends=(cython
             git
             python-setuptools-scm)
checkdepends=(python-pytest)
source=("git+https://github.com/kronenthaler/$_pyname")
sha256sums=(SKIP)

pkgver() {
  cd "$_pyname"
  git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$_pyname"
	python setup.py build
}

check() {
	cd "$_pyname"
	python setup.py test
}

package() {
	cd "$_pyname"
	python setup.py install --root="$pkgdir" --optimize=1
}
