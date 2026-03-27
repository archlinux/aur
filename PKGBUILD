# Maintainer: gogamlg3
pkgname=tg-ws-proxy-bin
pkgver=1.3.0
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

sha256sums=("58db0bc0e6af22ac1e30723cf1c373656483a78653ee20bed4bfdc380a3f9422"
            "676f8e0f00c70266352769c3abac806b1b7a18db3cf7cd8091a3b91913450260"
            "SKIP" "SKIP")

_binname="TgWsProxy_linux_amd64"

package() {
  cd "$srcdir"

  install -Dm755 "$_binname" "$pkgdir/usr/bin/tg-ws-proxy"

  install -d "$pkgdir/usr/share/icons/hicolor/256x256/apps"
  magick "icon.ico[6]" -background none -alpha on "$pkgdir/usr/share/icons/hicolor/256x256/apps/tg-ws-proxy.png"

  install -Dm644 "tg-ws-proxy.desktop" "$pkgdir/usr/share/applications/tg-ws-proxy.desktop"
  install -Dm644 "tg-ws-proxy.service" "$pkgdir/usr/lib/systemd/system/tg-ws-proxy.service"
}
