# Maintainer: Andre Schröder <andre.schroedr at gmail dot com>

# All my PKGBUILDs are managed at https://github.com/schra/pkgbuilds

_name=python-sphinx-math-dollar
pkgname=$_name-git
pkgver=1.2.1.r3.gbe629b9
_mainfolder=sphinx-math-dollar
pkgrel=1
pkgdesc='Sphinx extension to let you write LaTeX math using $$'
arch=(any)
url=https://github.com/sympy/sphinx-math-dollar
license=(MIT)
depends=(python)
makedepends=(python-setuptools git)
source=(git+$url)
sha256sums=('SKIP')
conflicts=($_name)
provides=($_name)

pkgver() {
  cd "$srcdir/$_mainfolder"

  # from https://wiki.archlinux.org/index.php/VCS_package_guidelines#Git
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "$srcdir/$_mainfolder"
  python setup.py build
}

package() {
  cd "$srcdir/$_mainfolder"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
