# Maintainer: fgonzalezurriola <fgonzalezurriola@gmail.com>
pkgname=shaula-bin
pkgver=0.1.4
pkgrel=1
pkgdesc='Wayland screenshot tool for Niri (prebuilt binary)'
arch=('x86_64')
url='https://github.com/fgonzalezurriola/shaula'
license=('MIT')
depends=(
  'cairo'
  'gdk-pixbuf2'
  'glibc'
  'grim'
  'gtk4'
  'gtk4-layer-shell'
  'hicolor-icon-theme'
  'slurp'
  'wayland'
  'wl-clipboard'
)
optdepends=(
  'niri: primary supported compositor and setup integration'
  'quickshell: Noctalia Shell integration'
  'ttf-geist: recommended UI font'
  'ttf-excalifont: recommended annotation font'
)
provides=('shaula')
conflicts=('shaula')
install='shaula.install'
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/shaula-linux-x86_64.tar.gz")
source=("LICENSE::${url}/raw/v${pkgver}/LICENSE")
sha256sums=('51100d4e517c591b0c6fa0bf94f10b86d7309736a46a23d53b0c85bf4c86966a')
sha256sums_x86_64=('70a3fb63facdefdcf3ef0dbf5f0d626bff092317171afdd75ca2845f0bb834bb')

package() {
  install -Dm755 "${srcdir}/bin/shaula" "${pkgdir}/usr/bin/shaula"
  install -Dm755 "${srcdir}/bin/shaula-overlay" "${pkgdir}/usr/bin/shaula-overlay"
  install -Dm755 "${srcdir}/bin/shaula-preview" "${pkgdir}/usr/bin/shaula-preview"
  install -Dm755 "${srcdir}/bin/shaula-settings" "${pkgdir}/usr/bin/shaula-settings"
  install -Dm755 "${srcdir}/bin/shaula-crop-image" "${pkgdir}/usr/bin/shaula-crop-image"

  cp -a "${srcdir}/share/." "${pkgdir}/usr/share/"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/shaula.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Name=Shaula
Comment=Wayland screenshot tool for Niri
Exec=shaula capture area --json
Icon=shaula
Terminal=false
Categories=Graphics;Utility;
StartupNotify=false
EOF
}
