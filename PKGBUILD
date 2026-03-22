pkgname=lintd-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Cross-distro Linux desktop package auditor - know what is installed, remove what is not needed"
arch=('x86_64')
url="https://github.com/mfscpayload-690/lintd"
license=('MIT')
depends=(
  'gtk3'
  'webkit2gtk-4.1'
  'libappindicator-gtk3'
  'librsvg'
  'fuse2'
  'polkit'
)
optdepends=(
  'flatpak: Flatpak package detection'
  'snapd: Snap package detection'
  'nvidia-utils: GPU metrics in dashboard'
)
provides=('lintd')
conflicts=('lintd')
source=(
  "lintd-bin-${pkgver}-x86_64.AppImage::https://github.com/mfscpayload-690/lintd/releases/download/v${pkgver}/Lintd-x86_64.AppImage"
  "lintd.png::https://raw.githubusercontent.com/mfscpayload-690/lintd/main/src-tauri/icons/128x128.png"
)
sha256sums=(
  'df1758d22da858630d2a119c2d5142d02c638f72fb52abaf21080c6336154b0b'
  'SKIP'
)
noextract=("lintd-bin-${pkgver}-x86_64.AppImage")

prepare() {
  chmod +x "${srcdir}/lintd-bin-${pkgver}-x86_64.AppImage"
}

package() {
  install -Dm755 \
    "${srcdir}/lintd-bin-${pkgver}-x86_64.AppImage" \
    "${pkgdir}/usr/bin/lintd"

  install -Dm644 \
    "${srcdir}/lintd.png" \
    "${pkgdir}/usr/share/icons/hicolor/128x128/apps/lintd.png"

  install -Dm644 /dev/stdin \
    "${pkgdir}/usr/share/applications/lintd.desktop" << 'EOF'
[Desktop Entry]
Name=Lintd
Comment=Cross-distro Linux package auditor
Exec=lintd
Icon=lintd
Terminal=false
Type=Application
Categories=Utility;System;PackageManager;
Keywords=package;manager;audit;clean;remove;orphan;
EOF
}
