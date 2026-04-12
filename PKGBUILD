# Maintained automatically by Beam release automation
pkgname=beam-launcher-bin
pkgver=1.0.6
pkgrel=1
pkgdesc="A blazing-fast, open-source command launcher for Linux"
arch=('x86_64')
url="https://github.com/krishkalaria12/beam"
license=('MIT')
depends=('gtk3' 'hicolor-icon-theme' 'libayatana-appindicator' 'librsvg' 'webkit2gtk-4.1')
provides=('beam')
conflicts=('beam')
options=('!strip')
source=(
  'beam-x86_64.AppImage::https://github.com/krishkalaria12/beam/releases/download/v1.0.6/beam_1.0.0_amd64.AppImage'
  'beam.desktop'
  'beam.png'
  'LICENSE'
)
noextract=('beam-x86_64.AppImage')
sha256sums=(
  'f30eb5ad4cd218e89ffcc98f762080db686e3e503037db38546810c48b67ad91'
  '7d15c07727daabdfda7d6f9296ee93f8c8f96d843d6c0d43bdcf5ca5b3902851'
  'a2a20586021b840189a4752a46d8a914ec13808d0da19173d165621a6102dd4b'
  'ac8271c92e0705cc6cdfa44336243253a98ef62dc35690c099fdb8597a553907'
)

package() {
  install -Dm755 "${srcdir}/beam-x86_64.AppImage" "${pkgdir}/opt/beam/beam.AppImage"
  install -Dm644 "${srcdir}/beam.desktop" "${pkgdir}/usr/share/applications/beam.desktop"
  install -Dm644 "${srcdir}/beam.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/beam.png"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/beam-launcher-bin/LICENSE"

  install -dm755 "${pkgdir}/usr/bin"
  cat > "${pkgdir}/usr/bin/beam" <<'EOF'
#!/usr/bin/env bash
if command -v fusermount >/dev/null 2>&1 || command -v fusermount3 >/dev/null 2>&1; then
  exec /opt/beam/beam.AppImage "$@"
fi

APPIMAGE_EXTRACT_AND_RUN=1 exec /opt/beam/beam.AppImage "$@"
EOF
  chmod 755 "${pkgdir}/usr/bin/beam"
}
