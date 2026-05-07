pkgname=hacklog-bin
pkgver=1.0.0
pkgrel=11
pkgdesc="Bug Bounty Research Tracker (Electron AppImage)"
arch=('x86_64')
url="https://github.com/pradeepkumar-404/HackLog"
license=('MIT')

provides=('hacklog')
conflicts=('hacklog')

depends=(
  'glibc'
  'gcc-libs'
  'nss'
  'libx11'
  'libxss'
  'libxtst'
  'libxkbfile'
  'libsecret'
  'alsa-lib'
  'fuse2'
)

options=('!strip' '!debug')

source=(
  "hacklog.AppImage::https://github.com/pradeepkumar-404/HackLog/releases/download/v${pkgver}/HackLog-${pkgver}-x86_64.AppImage"
  "hacklog.png::https://raw.githubusercontent.com/pradeepkumar-404/HackLog/main/build/icons/256x256.png"
)

sha256sums=(
  "0ecff6b4300668cc7ba4f1dd7d875750b562707aacc4634c2e8e9d2ec474ca16"
  "SKIP"
)

package() {
  cd "$srcdir"

  # install AppImage
  install -Dm755 "hacklog.AppImage" \
    "$pkgdir/opt/hacklog/hacklog.AppImage"

  # launcher
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/hacklog" <<EOF
#!/bin/bash
exec /opt/hacklog/hacklog.AppImage "\$@"
EOF

  # desktop file
  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/hacklog.desktop" <<EOF
[Desktop Entry]
Name=HackLog
Exec=hacklog
Icon=hacklog
Type=Application
Categories=Utility;Development;
StartupWMClass=HackLog
EOF

  # icon install (correct freedesktop path)
  install -Dm644 "hacklog.png" \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/hacklog.png"
}