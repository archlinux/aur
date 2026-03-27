# Maintainer: gogamlg3
pkgname=tg-ws-proxy-cli
pkgver=1.3.0
pkgrel=1
pkgdesc="Local SOCKS5 proxy server for partial bypassing of Telegram loading"
arch=("x86_64")
url="https://github.com/Flowseal/tg-ws-proxy"
license=("MIT")
depends=("python")
makedepends=("python" "python-pip")

source=("https://raw.githubusercontent.com/Flowseal/tg-ws-proxy/refs/tags/v$pkgver/proxy/tg_ws_proxy.py"
        "tg-ws-proxy-cli@.service")
sha256sums=("SKIP" "SKIP")


build() {
  cd "$srcdir/"

  python -m venv .venv
  .venv/bin/pip install --upgrade pip
  .venv/bin/pip install customtkinter==5.2.2 Pillow==12.1.1 psutil==7.0.0 pystray==0.19.5 pyperclip==1.9.0 cryptography==46.0.5 pyinstaller

  .venv/bin/pyinstaller --clean --noconfirm --onefile  --name "$pkgname" "tg_ws_proxy.py"

  rm -rf .venv
}

package() {
  cd "$srcdir"

  install -Dm755 "dist/$pkgname" "$pkgdir/usr/bin/$pkgname"

  install -Dm644 "$pkgname@.service" "$pkgdir/usr/lib/systemd/system/$pkgname@.service"

}
