pkgname='episteme-oss-bin'
pkgver='1.0.1'
pkgrel='1'
pkgdesc='Episteme oss offline desktop reader'
arch=('x86_64')
url='https://github.com/Aryan-Raj3112/episteme'
license=('AGPL-3.0-only')
depends=('alsa-lib' 'atk' 'cairo' 'dbus' 'expat' 'fontconfig' 'freetype2' 'gcc-libs' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk3' 'libcups' 'libarchive' 'libsecret' 'libx11' 'libxcomposite' 'libxdamage' 'libxext' 'libxi' 'libxrandr' 'libxrender' 'libxtst' 'nss' 'pango' 'zlib')
provides=('episteme-oss')
conflicts=('episteme-oss')
source=('episteme-oss-1.0.1-linux-x64.tar.gz::https://github.com/Aryan-Raj3112/episteme/releases/download/desktop-v1.0.1/episteme-oss-1.0.1-linux-x64.tar.gz')
sha256sums=('57f7e8f235af5ad0631741906cec99f48c668a152c3a8c81ebab62c61ab84f21')
options=('!debug')

package() {
  install -dm755 "$pkgdir/opt/episteme-oss"
  cp -a "episteme-oss/." "$pkgdir/opt/episteme-oss/"
  chmod 755 "$pkgdir/opt/episteme-oss/bin/Episteme oss"

  install -dm755 "$pkgdir/usr/bin"
  ln -sf "/opt/episteme-oss/bin/Episteme oss" "$pkgdir/usr/bin/episteme-oss"

  install -Dm644 "$pkgdir/opt/episteme-oss/share/licenses/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  local icon_path
  icon_path="$(find "$pkgdir/opt/episteme-oss" -name 'episteme_icon.png' -print -quit)"
  if [[ -n "$icon_path" ]]; then
    install -Dm644 "$icon_path" "$pkgdir/usr/share/icons/hicolor/512x512/apps/episteme-oss.png"
    install -Dm644 "$icon_path" "$pkgdir/usr/share/pixmaps/episteme-oss.png"
  fi

  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/episteme-oss.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Name=Episteme oss
Comment=Episteme oss offline desktop reader
Exec=episteme-oss %F
Icon=episteme-oss
Terminal=false
Categories=Office;Viewer;
MimeType=application/pdf;application/epub+zip;application/x-mobipocket-ebook;application/vnd.amazon.ebook;application/vnd.amazon.mobi8-ebook;text/markdown;text/x-markdown;text/plain;text/html;application/xhtml+xml;application/x-fictionbook+xml;application/x-zip-compressed-fb2;application/zip;application/vnd.comicbook+zip;application/x-cbz;application/vnd.comicbook-rar;application/x-cbr;application/x-rar-compressed;application/x-cb7;application/x-7z-compressed;application/vnd.comicbook+tar;application/x-cbt;application/x-tar;application/tar;application/vnd.openxmlformats-officedocument.wordprocessingml.document;application/vnd.openxmlformats-officedocument.presentationml.presentation;application/vnd.oasis.opendocument.text;application/x-vnd.oasis.opendocument.text-flat-xml;
EOF
}
