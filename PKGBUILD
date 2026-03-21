# Maintainer: Agustín Carrasco <asermax at gmail dot com>
pkgname=seemux-bin
_pkgname=seemux
pkgver=0.22.0
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
sha256sums=('1def40bb2d4dbbaeada98d8fd69784a827fd4cc11372d24d512a6b4d3de801a8')
sha256sums_x86_64=('1ad08ccc0c8a216947090cc2239e03a9fdbffbd2317280cd0ec861c6cb02aa3c' 'a14474bb0c6c07bf6545b3a8212ae6e9b74cf32948e6f208ee32979114b88309')

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
