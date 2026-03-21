# Maintainer: Agustín Carrasco <asermax at gmail dot com>
pkgname=seemux-bin
_pkgname=seemux
pkgver=0.23.1
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
sha256sums=('f5775488a093148efb4e6f49af24a7cbab415330ce942e6613062d703e7850cb')
sha256sums_x86_64=('4d7a004e2e3ae0fec5b9e74c35193ac468ce9ebe30b76edfcfaf8d8b159f3268' '12affa9d41674126c45512bbfe065ab5e2a54ca410e8a6d590f87c050ed18f32')

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
