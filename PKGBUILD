# Maintainer: Caleb Bassi <calebjbassi@gmail.com>

pkgname=swaylock-blur-git
_pkgname=${pkgname%-git}
pkgver=r1.943d40e
pkgrel=1
pkgdesc="Small swaylock wrapper written in bash to set a blurred image of the desktop as the background"
arch=("any")
url="https://github.com/cjbassi/swaylock-blur"
license=("MIT")
depends=("sway"
         "imagemagick"
         "grim")
makedepends=("git")
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
    mkdir -p ${pkgdir}/usr/bin/
    install ${srcdir}/${_pkgname}/${_pkgname} ${pkgdir}/usr/bin/${_pkgname}
}
