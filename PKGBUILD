# Maintainer: G-grbz <gkhn.gurbuz@hotmail.com>

pkgname=g-tmce
pkgver=1.6.0
pkgrel=1
pkgdesc="Tkinter app for creating and extracting MKV files with TMDB metadata"
arch=('any')
url="https://github.com/G-grbz/G-TMCE"
license=('GPL-3.0-only')
depends=(
  'hicolor-icon-theme'
  'python'
  'python-pillow>=10'
  'tk'
  'tkdnd2-git'
)
optdepends=(
  'kdialog: KDE-native file dialogs'
  'zenity: GTK-native file dialogs'
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('eda92482661765045ed285b0f454dc2c70e238324269ea07e74460d3118da504')

package() {
  cd "G-TMCE-${pkgver}"

  install -Dm755 mkv_creator_ui.py "${pkgdir}/usr/lib/g-tmce/mkv_creator_ui.py"
  install -Dm644 VERSION "${pkgdir}/usr/lib/g-tmce/VERSION"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 logo.png "${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/g-tmce.png"

  install -Dm644 G-TMCE.desktop "${pkgdir}/usr/share/applications/g-tmce.desktop"
  sed -i 's|^Path=.*|Path=/usr/lib/g-tmce|' "${pkgdir}/usr/share/applications/g-tmce.desktop"

  install -Dm644 mkv-creator-ui-extract.desktop \
    "${pkgdir}/usr/share/kio/servicemenus/g-tmce-extract.desktop"

  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/g-tmce" <<'EOF'
#!/bin/sh
cd /usr/lib/g-tmce || exit 1
exec /usr/bin/python /usr/lib/g-tmce/mkv_creator_ui.py "$@"
EOF
}
