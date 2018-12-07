# Maintainer: Caleb Bassi <calebjbassi@gmail.com>

pkgname=mons-git
_pkgname=${pkgname%-git}
pkgver=r117.261ecbc
pkgrel=1
pkgdesc="KISS and POSIX Shell script to quickly manage three monitors on X"
arch=("any")
url="https://github.com/Ventto/mons"
license=("MIT")
depends=("xorg-xrandr")
makedepends=("git"
             "help2man")
provides=(${_pkgname})
conflicts=(${_pkgname})
source=("git+${url}")
md5sums=("SKIP")

pkgver() {
  cd "${_pkgname}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  cd ${srcdir}/${_pkgname}
  make DESTDIR="${pkgdir}" install
}
