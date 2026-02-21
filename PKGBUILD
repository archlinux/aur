# Maintainer: Jeevash23 <https://github.com/Jeevash23>
pkgname=paperforge-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="A local-first PDF toolkit built with Tauri"
arch=('x86_64')
url="https://github.com/Jeevash23/paperforge"
license=('MIT')
depends=('webkit2gtk-4.1' 'libappindicator-gtk3' 'gtk3')
provides=('paperforge')
conflicts=('paperforge')

source_x86_64=("paperforge-${pkgver}.deb::https://github.com/Jeevash23/paperforge/releases/download/v${pkgver}/Paperforge_${pkgver}_amd64.deb")
sha256sums_x86_64=('SKIP')

package() {
  cd "$srcdir"

  # Extract the deb
  ar x "paperforge-${pkgver}.deb"
  tar xf data.tar.gz -C "${pkgdir}"

  # Rename binary from 'paperforge' (already named correctly in this project)
  # Icons: rename app.png -> paperforge.png if needed
  for size in 32x32 128x128; do
    if [ -f "${pkgdir}/usr/share/icons/hicolor/${size}/apps/app.png" ]; then
      mv "${pkgdir}/usr/share/icons/hicolor/${size}/apps/app.png" \
         "${pkgdir}/usr/share/icons/hicolor/${size}/apps/paperforge.png"
    fi
  done
  if [ -f "${pkgdir}/usr/share/icons/hicolor/256x256@2/apps/app.png" ]; then
    mv "${pkgdir}/usr/share/icons/hicolor/256x256@2/apps/app.png" \
       "${pkgdir}/usr/share/icons/hicolor/256x256@2/apps/paperforge.png"
  fi

  # Fix the desktop file
  sed -i 's|^Exec=app|Exec=paperforge|' "${pkgdir}/usr/share/applications/Paperforge.desktop" 2>/dev/null || true
  sed -i 's|^Icon=app|Icon=paperforge|' "${pkgdir}/usr/share/applications/Paperforge.desktop" 2>/dev/null || true
}
