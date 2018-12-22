# Maintainer: Caleb Bassi <calebjbassi@gmail.com>

pkgname=zgen-git
_pkgname=${pkgname%-git}
pkgver=r159.0b669d2
pkgrel=1
pkgdesc="A lightweight and simple plugin manager for ZSH"
arch=("any")
url="https://github.com/tarjoilija/zgen"
license=("BSD")
depends=("zsh")
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
  cd ${srcdir}/${_pkgname}
  install -Dm644 zgen.zsh ${pkgdir}/usr/share/zsh/share/zgen.zsh
  install -Dm644 _zgen ${pkgdir}/usr/share/zsh/site-functions/_zgen
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/{$_pkgname}/LICENSE"
}
