# Maintainer: Nathan Fisher <jeang3nie@hitchhiker-linux.org>

_pkgname=zterm

pkgname="${_pkgname}"
pkgver=0.3.0
pkgrel=1
pkgdesc="A simple terminal emulator using Vte and Gtk+ writting using the Zig programming language"
url="https://codeberg.org/jeang3nie/zterm"
license=('MIT')
depends=('libgtk-3.so' 'libvte-2.91.so')
makedepends=('git' 'zig' 'zigmod')
arch=('x86_64')
provides=('zterm')
conflicts=('zterm')
source=(
  "${url}/archive/v${pkgver}.tar.gz"
)
sha256sums=(
  'e767ceac4b656999a9bca065e4108e08f4e777bc7873b4ebca23e0aa29a766d4'
)

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
