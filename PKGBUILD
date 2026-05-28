pkgname=weflow-bin
pkgver=4.5.1
pkgrel=1
pkgdesc="Local WeChat database decryption and analysis tool"
arch=('x86_64')
url='https://github.com/hicccc77/WeFlow'
license=('CC-BY-NC-SA-4.0')
depends=(
  'alsa-lib'
  'at-spi2-core'
  'gtk3'
  'libx11'
  'libxcb'
  'libxcomposite'
  'libxdamage'
  'libxext'
  'libxfixes'
  'libxkbcommon'
  'libxrandr'
  'mesa'
  'nss'
)
provides=('weflow')
conflicts=('weflow')
options=('!debug' '!strip')
source=("WeFlow-${pkgver}-Setup.tar.gz::${url}/releases/download/v${pkgver}/WeFlow-${pkgver}-Setup.tar.gz")
sha256sums=('eef12e315b0ee354640468b163ba02b8e603f881c6a2a00149b50db6d7984d73')

package() {
  local src_app="$srcdir/WeFlow-${pkgver}-Setup"
  local install_dir="$pkgdir/opt/weflow"

  install -dm755 "$install_dir" "$pkgdir/usr/bin"
  cp -a "$src_app/"* "$install_dir/"

  ln -s /opt/weflow/weflow "$pkgdir/usr/bin/weflow"

  install -Dm644 "$src_app/resources/icon.png" \
    "$pkgdir/usr/share/icons/hicolor/1024x1024/apps/weflow.png"
  install -Dm644 "$src_app/resources/resources/installer/linux/icon.png" \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/weflow.png"

  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/weflow.desktop" <<'EOF'
[Desktop Entry]
Name=WeFlow
Comment=Local WeChat database decryption and analysis tool
Exec=weflow %U
Terminal=false
Type=Application
Icon=weflow
StartupWMClass=WeFlow
Categories=Utility;
EOF

  install -Dm644 "$src_app/LICENSE.electron.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE.electron.txt"
  install -Dm644 "$src_app/LICENSES.chromium.html" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSES.chromium.html"
}
