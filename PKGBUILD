# Maintainer: gogamlg3
pkgname=tg-ws-proxy-bin
pkgver=1.2.0
pkgrel=1
pkgdesc="Local SOCKS5 proxy server for partial bypassing of Telegram loading"
arch=('x86_64')
url="https://github.com/Flowseal/tg-ws-proxy"
license=('MIT')
depends=()
makedepends=('imagemagick')
source=("https://github.com/Flowseal/tg-ws-proxy/releases/download/v$pkgver/TgWsProxy_linux_amd64"
        "https://raw.githubusercontent.com/Flowseal/tg-ws-proxy/refs/heads/main/icon.ico")

sha256sums=("0b3a7b27571deee804cccf8daecaac1cbcec46dcecb8f11991bcffeb074f7f5e"
            "9d18faf66dc730cf05ff2b01efcb8a69f0c585c1cec9408cf222dc8e198d111c")

_binname="TgWsProxy_linux_amd64"

package() {
  cd "$srcdir"

  install -Dm755 "$_binname" "$pkgdir/usr/bin/tg-ws-proxy"

  install -d "$pkgdir/usr/share/icons/hicolor/64x64/apps"
  magick "icon.ico[4]" -background none -alpha on "$pkgdir/usr/share/icons/hicolor/64x64/apps/tg-ws-proxy.png"

  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/tg-ws-proxy.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Name=tg-ws-proxy
Comment=Local SOCKS5 proxy server for partial bypassing of Telegram loading
Exec=/usr/bin/tg-ws-proxy
Icon=tg-ws-proxy
Terminal=false
Categories=Utility;
EOF
}
