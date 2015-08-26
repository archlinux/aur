# Maintainer: Florian Walch <florian+aur@fwalch.com>

pkgname=libvterm-git-neovim
_commit=1b745d29d45623aa8d22a7b9288c7b0e331c7088
pkgrel=1
pkgver=0.r671.1b745d2
pkgdesc="Abstract library implementation of a VT220/xterm/ECMA-48 terminal emulator; experimental version needed for Neovim."
arch=('i686' 'x86_64')
url="http://www.leonerd.org.uk/code/libvterm"
license=('MIT')
makedepends=('git')
conflicts=('libvterm' 'libvterm-bzr')
provides=('libvterm')
source=("${pkgname}::git://github.com/neovim/libvterm#commit=${_commit}")
md5sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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
