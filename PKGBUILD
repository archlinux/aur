# Maintainer: Jochem Kuipers <jochem@kuipers.cc>
pkgname=thrm-bin
pkgver=3.6.2
pkgrel=1
pkgdesc='Flydigi BS-series laptop cooler controller (prebuilt)'
arch=('x86_64')
url='https://github.com/TIANLI0/THRM'
license=('MIT')
depends=('gtk3' 'webkit2gtk-4.1' 'hidapi')
optdepends=('bluez: BS1 BLE support')
provides=('thrm')
conflicts=('thrm')
options=('!strip' '!debug')
source=(
  "https://github.com/TIANLI0/THRM/releases/download/v${pkgver}/THRM-linux-amd64-portable.tar.gz"
  "LICENSE::https://raw.githubusercontent.com/TIANLI0/THRM/v${pkgver}/LICENSE"
)
sha256sums=(
  '3d146a8e42a58d076f9719d3b4af2e653e5b4ae5b3fcbda22a8fb3c33c7bbf4f'
  'bb4f94dbe3dcfdc66e27d35cae627a73c9e8f66ec792971e569d272893b08ac6'
)

package() {
  cd "$srcdir/THRM-linux-amd64"

  install -Dm755 thrm "$pkgdir/usr/bin/thrm"
  install -Dm755 thrm-core "$pkgdir/usr/bin/thrm-core"
  install -Dm644 99-flydigi-fan.rules "$pkgdir/usr/lib/udev/rules.d/99-flydigi-fan.rules"
  install -Dm644 appicon.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/thrm.png"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/thrm.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Name=THRM Fan Control
Comment=Flydigi BS Series Fan Controller
Exec=/usr/bin/thrm
Icon=thrm
Terminal=false
Categories=Utility;
EOF
}
