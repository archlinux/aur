pkgname=lunahr
pkgver=2.1.1
pkgrel=1
pkgdesc="Polar H10 heart rate monitor app with OSC and logging"
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
)

source=(https://github.com/PetLucy/LunaHR-Linux/archive/refs/tags/v${pkgver}.tar.gz)
sha256sums=('e99d35f1ffef002cfac191aa960c2016c4c8ba8194885de0e0bff3b5f0fb56c2')

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

