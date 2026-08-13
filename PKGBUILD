# Maintainer: gogamlg3
pkgname=tg-ws-proxy-bin
pkgver=1.10.0
pkgrel=1
pkgdesc="Local MTProto proxy server for partial bypassing of Telegram loading"
arch=("x86_64")
url="https://github.com/Flowseal/tg-ws-proxy"
license=("MIT")
depends=("libappindicator" "libayatana-appindicator")
optdepends=("wl-clipboard" "xclip" "xsel")
makedepends=("imagemagick")
conflicts=("tg-ws-proxy-git")
source=("https://github.com/Flowseal/tg-ws-proxy/releases/download/v$pkgver/TgWsProxy_linux_amd64"
        "https://raw.githubusercontent.com/Flowseal/tg-ws-proxy/refs/tags/v$pkgver/icon.ico"
        "tg-ws-proxy.desktop"
        "tg-ws-proxy.service")

sha256sums=("bb14856f751b3d275b8507f8e55fd80678d2eb7f3f7ae93a448c805045c7811f"
            "4b3108858a414b35d0a6fde2e304fb7ae18e5b2831e69e9e492cfdb1b048009d"
            "e06f5ca3f96bde84404610dbee8df3bdf1017fa350cd6e09831d30d820d21e93"
            "34263521bef49c289d3956fb513780950a6f319cb6d4b0222034d32ab929f05d")

_binname="TgWsProxy_linux_amd64"

package() {
  cd "$srcdir"

  install -Dm755 "$_binname" "$pkgdir/usr/bin/tg-ws-proxy"

  install -d "$pkgdir/usr/share/icons/hicolor/64x64/apps"
  magick "icon.ico[5]" -background none -alpha on "$pkgdir/usr/share/icons/hicolor/64x64/apps/tg-ws-proxy.png"

  install -Dm644 "tg-ws-proxy.desktop" "$pkgdir/usr/share/applications/tg-ws-proxy.desktop"
  install -Dm644 "tg-ws-proxy.service" "$pkgdir/usr/lib/systemd/system/tg-ws-proxy.service"
}
