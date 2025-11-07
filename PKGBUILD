pkgname=game-chronicle
pkgver=0.13.0
pkgrel=1
pkgdesc="A desktop application for logging your gaming sessions"
arch=('x86_64' 'aarch64')
url="https://github.com/ItsCentric/game-chronicle-app"
license=('MIT')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1')
optdepends=('gst-plugins-good: For media playback support')
options=('!strip' '!emptydirs')
source=("game-chronicle.desktop" "icon.png")
sha256sums=('SKIP' 'SKIP')
source_x86_64=(
  "game-chronicle-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/Game.Chronicle_x64.app.tar.gz"
)
source_aarch64=(
  "game-chronicle-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/Game.Chronicle_aarch64.app.tar.gz"
)

sha256sums_x86_64=('SKIP')
sha256sums_aarch64=('SKIP')

package() {
  install -dm755 "${pkgdir}/opt/${pkgname}"
  tar -xzf "$srcdir/game-chronicle-${pkgver}-${CARCH}.tar.gz" -C "${pkgdir}/opt/${pkgname}"

  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/game-chronicle" <<'EOF'
#!/bin/sh
WEBKIT_DISABLE_DMABUF_RENDERER=1

exec /opt/game-chronicle/game-chronicle "$@"
EOF
  install -Dm644 "${srcdir}/game-chronicle.desktop" "${pkgdir}/usr/share/applications/game-chronicle.desktop"
  install -Dm644 "${srcdir}/icon.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/game-chronicle.png"
}
