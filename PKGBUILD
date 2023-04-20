# Maintainer: <reg-archlinux AT klein DOT tuxli DOT ch> 

_pkgname=lchat
pkgname=${_pkgname}-git
pkgver=r114.9778b6
pkgrel=1
pkgdesc="line chat is a line oriented front end for ii-like chat programs."
url="https://libs.suckless.org/lchat/"
license=("ISC")
arch=("any")
makedepends=("git")
depends=('libgrapheme')
provides=("lchat")
conflicts=("lchat")
source=("git://git.suckless.org/lchat")
sha256sums=("SKIP")

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${_pkgname}"
  make PREFIX=/usr all
}

check() {
  cd "${_pkgname}"
  make PREFIX=/usr test
}

package() {
  cd "${_pkgname}"
  install -Dm755 "${_pkgname}" "${pkgdir}"/usr/bin/"${_pkgname}"
  install -Dm644 README.md "${pkgdir}"/usr/share/doc/"${_pkgname}"/README.md
}

