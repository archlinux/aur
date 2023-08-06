pkgname=python-svg-to-gcode-git
_pkgname=SvgToGcode
pkgver=r82.e7d3954
pkgrel=1
pkgdesc="Python 3 package for Svg to Gcode - Flamma project"
arch=('any')
url="https://github.com/PadLex/SvgToGcode.git"
license=('GNU')
depends=('python')
makedepends=('python-setuptools')
source=("python-svg-to-gcode-git::git+https://github.com/PadLex/SvgToGcode.git")
b2sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd $pkgname
  python setup.py build
}

package() {
  cd $pkgname
  python setup.py install --skip-build -O1 --root="$pkgdir"
}
