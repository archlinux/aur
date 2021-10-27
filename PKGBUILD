# Maintainer: Thomas "Ventto" Venriès <thomas.venries@gmail.com>

pkgname=lux-git
_pkgname=${pkgname%-git}
pkgver=r109.0f03aff
pkgrel=1
pkgdesc='POSIX Shell script to easily control brightness on backlight controllers.'
arch=('any')
url="https://github.com/Ventto/lux"
license=('GPL3')
provides=(${_pkgname})
conflicts=(${_pkgname})
makedepends=('help2man')
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
