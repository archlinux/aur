pkgname=just-talk-bin
pkgver=1.0.8
pkgrel=1
pkgdesc="Speech recognition app with global hotkey support"
arch=('x86_64')
url="https://github.com/whoamihappyhacking/just-talk"
license=('GPL-3.0-or-later')
depends=('fuse2')
options=('!debug' '!strip')
provides=('just-talk')
conflicts=('just-talk' 'just-talk-git')
_pkgfile="just-talk-${pkgver}-x86_64.AppImage"
source=(
  "${_pkgfile}::https://github.com/whoamihappyhacking/just-talk/releases/download/v${pkgver}/${_pkgfile}"
  "icon.png::https://raw.githubusercontent.com/whoamihappyhacking/just-talk/v${pkgver}/icon.png"
  "just-talk.desktop::https://raw.githubusercontent.com/whoamihappyhacking/just-talk/v${pkgver}/just-talk.desktop"
)
sha256sums=(
  '4c848de802df2793b48f700bae1ad44e64cf0e06f63962f7e3840deede5045e0'
  'SKIP'
  'SKIP'
)

package() {
  # Install AppImage as the main binary
  install -Dm755 "$srcdir/${_pkgfile}" "$pkgdir/usr/bin/just-talk.appimage"

  # Create wrapper script
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/just-talk" <<'EOF'
#!/bin/bash
exec /usr/bin/just-talk.appimage "$@"
EOF

  # Install icon
  install -Dm644 "$srcdir/icon.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/just-talk.png"

  # Install desktop file
  install -Dm644 "$srcdir/just-talk.desktop" "$pkgdir/usr/share/applications/just-talk.desktop"
}
