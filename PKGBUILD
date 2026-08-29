pkgname=lunahr
pkgver=2.2.1
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
sha256sums=('156bf682dda7a32d806202a02006370d8449e29159eabb9199eb82a38b5a86da')

package() {
  cd "$srcdir/LunaHR-Linux-${pkgver}"

  install -Dm644 lunahr.py "$pkgdir/usr/lib/lunahr/lunahr.py"
  install -Dm644 lunahr-tray-active.png "$pkgdir/usr/share/lunahr/lunahr-tray-active.png"
  install -Dm644 lunahr-tray-inactive.png "$pkgdir/usr/share/lunahr/lunahr-tray-inactive.png"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/lunahr" <<'EOF'
#!/usr/bin/env bash
exec /usr/bin/python3 /usr/lib/lunahr/lunahr.py "$@"
EOF

  install -Dm644 lunahr.desktop "$pkgdir/usr/share/applications/lunahr.desktop"
  install -Dm644 lunahr.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/lunahr.png"
}

