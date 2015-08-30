# Maintainer: Florian Walch <florian+aur@fwalch.com>

pkgname=libvterm-bzr
pkgver=r650
pkgrel=1
pkgdesc='Abstract library implementation of a VT220/xterm/ECMA-48 terminal emulator.'
arch=('i686' 'x86_64')
url='http://www.leonerd.org.uk/code/libvterm'
license=('MIT')
makedepends=('bzr')
conflicts=('libvterm')
provides=("libvterm=${pkgver}")
source=("${pkgname}::bzr+http://bazaar.leonerd.org.uk/c/libvterm/")
sha256sums=('SKIP')
options=('staticlibs')

pkgver() {
  cd "${pkgname}"
  printf "r%s" "$(bzr revno)"
}

build() {
  cd "${pkgname}"
  make PREFIX=/usr
}

package() {
  cd "${pkgname}"
  make PREFIX=/usr DESTDIR="${pkgdir}" install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set sw=2 sts=2 et:
