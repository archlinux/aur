# Maintainer: Sjoerd Timmer <sjoerdtimmer@gmail.com>

pkgname=swaylock-blur-multimonitor-git
_pkgname=${pkgname%-git}
pkgver=r1.0d10fea
pkgrel=1
pkgdesc="A script that runs swaylock and sets the image to a blurred screenshot of the desktop."
arch=("any")
url="https://github.com/sjoerdtimmer/swaylock-blur-multimonitor"
license=("LGPL")
depends=("swaylock" "imagemagick" "grim" "python3" "i3ipc-python")
provides=(${_pkgname})
conflicts=(${_pkgname})
makedepends=("git")
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
    install ${srcdir}/${_pkgname}/swaylock-blur ${pkgdir}/usr/bin/swaylock-blur
}
