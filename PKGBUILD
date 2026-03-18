# Maintainer: Agustín Carrasco <asermax at gmail dot com>
pkgname=seemux-bin
_pkgname=seemux
pkgver=0.13.4
pkgrel=1
pkgdesc="A GTK4 terminal multiplexer for Linux with Claude Code integration"
arch=('x86_64')
url="https://github.com/asermax/seemux"
license=('LicenseRef-unknown')
depends=('gtk4' 'gtk4-layer-shell' 'vte4' 'glib2' 'pango' 'glibc')
optdepends=('socat: Claude Code hook communication')
provides=('seemux')
conflicts=('seemux' 'seemux-git')
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
source_x86_64=("${_pkgname}-bin-${pkgver}::${url}/releases/download/v${pkgver}/${_pkgname}-linux-x86_64"
                "${_pkgname}-tmux-shim-bin-${pkgver}::${url}/releases/download/v${pkgver}/${_pkgname}-tmux-shim-linux-x86_64")
sha256sums=('c3aba362a9e2de8dd685560ea6b8a781225f36fa8d0bada9d4a14f7a04938a07')
sha256sums_x86_64=('f154a49d624786c05b17e1d5697822fdf714d44d2d13947fecb1a6addf6a2c0b' '34194f485d76776f87789b6357cd28c79e1215eaa095bdc61f262fb5f39063c4')

latestver() {
  curl -s "https://api.github.com/repos/asermax/seemux/releases/latest" | \
    grep '"tag_name":' | sed -E 's/.*"v([^"]+)".*/\1/' || true
}

package() {
  install -Dm755 "${_pkgname}-bin-${pkgver}" "$pkgdir/usr/bin/${_pkgname}"
  install -Dm755 "${_pkgname}-tmux-shim-bin-${pkgver}" "$pkgdir/usr/bin/${_pkgname}-tmux-shim"

  cd "${_pkgname}-${pkgver}"
  install -Dm644 "extra/linux/seemux.desktop" "$pkgdir/usr/share/applications/seemux.desktop"
  install -Dm644 "extra/logo/seemux-128x128.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/seemux.png"
  install -Dm644 "extra/logo/seemux-256x256.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/seemux.png"
  install -Dm644 "extra/logo/seemux-48x48.png" "$pkgdir/usr/share/icons/hicolor/48x48/apps/seemux.png"
  install -Dm644 "extra/logo/seemux-512x512.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/seemux.png"
}
