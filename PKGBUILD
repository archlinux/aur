# Maintainer: smiley <smiley@archlinux.org>
pkgname=furious-bin
pkgver=0.8.2
pkgrel=1
pkgdesc="GUI proxy client based on PySide6 supporting Xray-core & hysteria (official prebuilt release)"
arch=('x86_64' 'aarch64')
url="https://github.com/LorenEteval/Furious"
license=('GPL-3.0-or-later')
options=('!debug')
depends=('glibc' 'gcc-libs' 'libglvnd' 'libx11' 'libxcb' 'xcb-util'
         'xcb-util-cursor' 'xcb-util-image' 'xcb-util-keysyms'
         'xcb-util-renderutil' 'xcb-util-wm')
source_x86_64=("Furious-${pkgver}-linux-x86_64.deb::https://github.com/LorenEteval/Furious/releases/download/${pkgver}/Furious-${pkgver}-linux-x86_64.deb")
source_aarch64=("Furious-${pkgver}-linux-aarch64.deb::https://github.com/LorenEteval/Furious/releases/download/${pkgver}/Furious-${pkgver}-linux-aarch64.deb")
sha256sums_x86_64=('b7889bbad8bb91ae275b10cdfbb20e50ff6f55e5dd1b1b14dd677e552027618d')
sha256sums_aarch64=('4df37882e7b4a54c0078bbb3c9df4d9bde7f8667430b289c4e910e4c90b561d4')

package() {
  # deb is an ar archive; bsdtar extracts control.tar.zst + data.tar.zst
  bsdtar -xf "${srcdir}/Furious-${pkgver}-linux-${CARCH}.deb"
  bsdtar -xf data.tar.zst -C "${pkgdir}"

  # upstream ships a broken Exec line; the launcher is /usr/bin/Furious
  sed -i 's#^Exec=Furious\.bin#Exec=Furious#' \
    "${pkgdir}/usr/share/applications/Furious.desktop"
}