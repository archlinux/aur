pkgname=alogi
pkgver=0.1.33
pkgrel=1
pkgdesc="AI-powered log viewer"
arch=("x86_64")
url="https://github.com/allisonhere/alogi"
license=("MIT")
depends=(
  "glibc"
  "gtk3"
  "nss"
  "libxss"
  "libxtst"
  "alsa-lib"
  "libxrandr"
  "libxkbcommon"
  "libxcomposite"
  "libxdamage"
  "libxfixes"
  "libxi"
  "libxrender"
  "libxcursor"
  "at-spi2-core"
  "libdrm"
  "mesa"
  "libnotify"
  "libcups"
  "pango"
  "cairo"
  "dbus"
  "glib2"
)
source=("https://github.com/allisonhere/alogi/releases/download/v${pkgver}/alogi-${pkgver}-linux-unpacked.tar.gz"
        "alogi.desktop"
        "icon.png")
sha256sums=("51d37d2e6e9eb9bfaa20df432eea134fee6e246eafa0cb12beff744067efd449" "SKIP" "SKIP")

package() {
  install -d "${pkgdir}/opt/alogi"
  cp -a "${srcdir}/linux-unpacked/"* "${pkgdir}/opt/alogi/"

  # Wrapper script that launches detached from terminal
  install -d "${pkgdir}/usr/bin"
  cat > "${pkgdir}/usr/bin/alogi" << 'EOF'
#!/bin/bash
/opt/alogi/alogi "$@" &>/dev/null & disown
EOF
  chmod 755 "${pkgdir}/usr/bin/alogi"

  install -Dm644 "${srcdir}/alogi.desktop" "${pkgdir}/usr/share/applications/alogi.desktop"
  install -Dm644 "${srcdir}/icon.png" "${pkgdir}/usr/share/pixmaps/alogi.png"
}
