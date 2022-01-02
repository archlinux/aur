# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

_pkgname=zterm

pkgname="${_pkgname}"
pkgver=0.2.1
pkgrel=1
pkgdesc="A simple terminal emulator using Vte and Gtk+ writting using the Zig programming language"
url="https://gitlab.com/jeang3nie/zterm"
license=('MIT')
depends=('libgtk-3.so' 'libvte-2.91.so')
makedepends=('git' 'zig' 'zigmod')
arch=('x86_64')
provides=('zterm')
conflicts=('zterm')
source=(
  "${url}/-/archive/v${pkgver}/${_pkgname}-v${pkgver}.tar.bz2"
)
sha256sums=(
  'c838251fb67e1bca43eb40019ef03b96f0d9e62527022cf023df37756ee62f72'
)

build() {
  cd "${srcdir}/${_pkgname}-v${pkgver}"
  zigmod fetch
  zig build -Drelease-safe=true
}

package() {
  cd "${srcdir}/${_pkgname}-v${pkgver}"
  install -D -m755 zig-out/bin/zterm "${pkgdir}/usr/bin/zterm"
  install -D -m644 README.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -D -m644 LICENSE.md "${pkgdir}/usr/share/licenses/${_pkgname}/README.md"
  install -D -m644 data/zterm.desktop "${pkgdir}/usr/share/applications/zterm.desktop"
  install -D -m644 data/zterm.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/zterm.svg"
}
