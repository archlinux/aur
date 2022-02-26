# Maintainer: nobodyinperson <nobodyinperson at posteo de>
_name=json2tex
pkgname="python-${_name}-git"
pkgver=1.0.0.r1.g5be43a7
pkgrel=1
pkgdesc="Convert JSON for usage in LaTeX"
arch=('any')
url="https://gitlab.com/nobodyinperson/${_name}"
license=('MIT')
makedepends=('git' 'python' 'python-wheel' 'python-build' 'python-installer>=0.5')
conflicts=("python-${_name}")
provides=("${_name}")
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long --tags | sed 's/^v//; s/\([^-]*-g\)/r\1/; s/-/./g'
}

build() { 
  cd $pkgname
  python -m build --wheel --no-isolation
}

package() {
  cd $pkgname
  python -m installer --destdir="$pkgdir/" dist/*.whl
}

# vim:set ts=2 sw=2 et:
