# Maintainer: Nathan Fisher <jeang3nie@hitchhiker-linux.org>

_pkgname=zterm

pkgname="${_pkgname}-git"
pkgver=r80.9772c67
pkgrel=1
pkgdesc="A simple terminal emulator using Vte and Gtk+ written using the Zig programming language"
url="https://codeberg.org/jeang3nie/zterm"
license=('MIT')
depends=('gtk3' 'libvte-2.91.so')
makedepends=('git' 'zig' 'zigmod')
arch=('x86_64')
provides=('zterm')
conflicts=('zterm')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${_pkgname}"
}

build() {
  cd "${srcdir}/${_pkgname}"
  zigmod ci
  zig build -Drelease-safe=true
}

package() {
  cd "${srcdir}/${_pkgname}"
  install -D -m755 zig-out/bin/zt "${pkgdir}/usr/bin/zt"
  install -D -m644 README.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -D -m644 LICENSE.md "${pkgdir}/usr/share/licenses/${_pkgname}/README.md"
  install -D -m644 data/zterm.desktop "${pkgdir}/usr/share/applications/zterm.desktop"
  install -D -m644 data/zterm.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/zterm.svg"
}
