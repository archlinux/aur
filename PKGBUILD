# Maintainer: Agustín Carrasco <asermax at gmail dot com>
pkgname=seemux-bin
_pkgname=seemux
pkgver=0.19.0
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
sha256sums=('39ceefe69f3d85b5559c60fb7f5a9243b182562eac784755d4d8de8d2653b66c')
sha256sums_x86_64=('ce60b1bbfa7b7e6a9d58f44ba8a96198f6c49296eef9fbd157b12a15427cea71' 'da1c79ee133ce3b740f22eff7716453653663dd27bc08c4fb903256277e3cce2')

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
