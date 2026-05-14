# Maintainer: Luke Morrison <lukejmorrison@gmail.com>

pkgname=canvasforge-beta
pkgver=0.6.0_beta2
pkgrel=1
pkgdesc="Beta PyQt6 canvas utility for remixing screenshots, UI snippets, and vector assets"
arch=('any')
url="https://github.com/lukejmorrison/canvasforge"
license=('MIT')
depends=('python' 'python-pyqt6')
provides=('canvasforge')
conflicts=('canvasforge')
options=('!debug')
_tagver="${pkgver/_beta/-beta.}"
source=("canvasforge-${_tagver}.tar.gz::${url}/releases/download/v${_tagver}/canvasforge-${_tagver}.tar.gz")
sha256sums=('4c6d7205a813839f8d2ca2e86c729fd2d8f5eaf040cd5d13752143b39ed4d4f3')

package() {
  cd "canvasforge-${_tagver}"

  install -dm755 "${pkgdir}/usr/share/canvasforge"
  cp -a \
    AGENT.md \
    CHANGELOG.md \
    README.md \
    SKILL.md \
    TODO.md \
    artifacts \
    assets \
    featurerequest \
    image_library_panel.py \
    main.py \
    plugin_manager.py \
    plugins \
    requirements.txt \
    undo_manager.py \
    "${pkgdir}/usr/share/canvasforge/"

  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/canvasforge" <<'EOF'
#!/usr/bin/env bash
exec python /usr/share/canvasforge/main.py "$@"
EOF

  install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/canvasforge.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Name=CanvasForge Beta
Comment=Remix screenshots, snippets, and vectors
Exec=canvasforge
Icon=canvasforge
Terminal=false
Categories=Graphics;AudioVideo;
EOF

  install -Dm644 \
    assets/app_icons/canvasForge_app_icon.png \
    "${pkgdir}/usr/share/icons/hicolor/256x256/apps/canvasforge.png"
}
