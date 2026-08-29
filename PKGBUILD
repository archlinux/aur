pkgname=lunahr
pkgver=2.2
pkgrel=1
pkgdesc="Heart rate monitor for VRChat OSC with Polar H10 (BLE) and Pulsoid support"
arch=('x86_64')
url="https://github.com/PetLucy/LunaHR-Linux"
license=('custom')

depends=(
  'python'
  'pyside6'
  'python-pyqtgraph'
  'python-bleak'
  'python-osc'
  'python-colorama'
  'python-websockets'
)

source=(https://github.com/PetLucy/LunaHR-Linux/archive/refs/tags/v${pkgver}.tar.gz)
sha256sums=('2b77ddade8d25509a464cf09f09f580b34f220b0c41bd8cf9d822f4e5c69c473')

package() {
  cd "$srcdir/LunaHR-Linux-${pkgver}"

  install -Dm644 lunahr.py "$pkgdir/usr/lib/lunahr/lunahr.py"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/lunahr" <<'EOF'
#!/usr/bin/env bash
exec /usr/bin/python3 /usr/lib/lunahr/lunahr.py "$@"
EOF

  install -Dm644 lunahr.desktop "$pkgdir/usr/share/applications/lunahr.desktop"
  install -Dm644 lunahr.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/lunahr.png"
}

