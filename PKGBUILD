# Maintainer: Luke Morrison <lukejmorrison@gmail.com>

pkgname=canvasforge-beta
pkgver=0.6.0_beta10
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
sha256sums=('8509481e2cf565b98932f24d9c6dabf2566f510a0907ee864cecee6c0779237e')

package() {
  cd "canvasforge-${_tagver}"

  install -dm755 "${pkgdir}/usr/share/canvasforge"
  cp -a \
    AGENT.md \
    CHANGELOG.md \
    README.md \
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

  install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/canvasforge.desktop" <<EOF
[Desktop Entry]
Type=Application
Name=CanvasForge Beta ${_tagver}
Comment=Remix screenshots, snippets, and vectors
Exec=canvasforge
Icon=canvasforge
Terminal=false
Categories=Graphics;
EOF

  install -Dm644 \
    assets/app_icons/canvasForge_app_icon.png \
    "${pkgdir}/usr/share/icons/hicolor/256x256/apps/canvasforge.png"
}
