# Maintainer: Caleb Bassi <calebjbassi@gmail.com>

pkgname=vimclip-git
_pkgname=${pkgname%-git}
pkgver=r8.5a69162
pkgrel=1
pkgdesc="A tiny script to spawn your favorite \$EDITOR and leave what you typed in your clipboard"
arch=("any")
url="https://github.com/hrantzsch/vimclip"
license=("MIT")
depends=("xsel")
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
    mkdir -p "${pkgdir}/usr/bin"
    mv ${srcdir}/${_pkgname}/${_pkgname} ${pkgdir}/usr/bin
}
