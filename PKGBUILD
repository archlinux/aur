# Maintainer: William Belanger <echo d2lsbGlhbS5iZWxyQGdtYWlsLmNvbQ== | base64 -d>

_pkgname=qtpad
pkgname="$_pkgname"-git
pkgver=0.0.0
pkgrel=1
provides=("$_pkgname")
conflicts=("$_pkgname")
pkgdesc="Modern and customizable sticky note application"
url="https://github.com/willbelr/$_pkgname"
arch=("any")
license=("GPL3")
depends=("python>=3" "python-pyqt5" "qt5-svg" "python-requests")
source=("git+https://github.com/willbelr/$_pkgname.git")
md5sums=("SKIP")

pkgver()
{
  cd "$_pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package()
{
  cd "$_pkgname"
  python setup.py install --root="$pkgdir"
}
