# Maintainer: gogamlg3
pkgname=tg-ws-proxy-bin
pkgver=1.2.1
pkgrel=1
pkgdesc="Local SOCKS5 proxy server for partial bypassing of Telegram loading"
arch=("x86_64")
url="https://github.com/Flowseal/tg-ws-proxy"
license=("MIT")
depends=("libappindicator" "libayatana-appindicator")
optdepends=("wl-clipboard" "xclip" "xsel")
makedepends=("imagemagick")
conflicts=("tg-ws-proxy-git")
source=("https://github.com/Flowseal/tg-ws-proxy/releases/download/v$pkgver/TgWsProxy_linux_amd64"
        "https://raw.githubusercontent.com/Flowseal/tg-ws-proxy/refs/heads/main/icon.ico"
        "tg-ws-proxy.desktop"
        "tg-ws-proxy.service")

sha256sums=("bacd6a2abf93614b92a082d2754abd573ba4930b7475222a1624c948da5a61f4"
            "9d18faf66dc730cf05ff2b01efcb8a69f0c585c1cec9408cf222dc8e198d111c"
            "SKIP" "SKIP")

_binname="TgWsProxy_linux_amd64"

package() {
  cd "$srcdir"

  install -Dm755 "$_binname" "$pkgdir/usr/bin/tg-ws-proxy"

  install -d "$pkgdir/usr/share/icons/hicolor/64x64/apps"
  magick "icon.ico[4]" -background none -alpha on "$pkgdir/usr/share/icons/hicolor/64x64/apps/tg-ws-proxy.png"

  install -Dm644 "tg-ws-proxy.desktop" "$pkgdir/usr/share/applications/tg-ws-proxy.desktop"
  install -Dm644 "tg-ws-proxy.service" "$pkgdir/usr/lib/systemd/system/tg-ws-proxy.service"
}
