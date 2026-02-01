# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=notepadnext-bin
pkgver=0.13
pkgrel=1
pkgdesc="A cross-platform, reimplementation of Notepad++ (binary release)"
url="https://github.com/dail8859/NotepadNext"
license=('GPL-3.0-only')
arch=('x86_64')
depends=('qt6-5compat' 'qt6-base')
makedepends=('fuse2')
conflicts=("notepadnext")
provides=("notepadnext")
options=(!strip)
source=("$url/releases/download/v$pkgver/NotepadNext-v$pkgver-x86_64.AppImage")
sha256sums=('e32f904b791220e60be94002b67d3e77f2aa2f2876a55c2b4170fbdd11af6290')

prepare() {
# Extract the AppImage
  chmod +x "./NotepadNext-v$pkgver-x86_64.AppImage"
  "./NotepadNext-v$pkgver-x86_64.AppImage" --appimage-extract
# Edit the shortcut
  cd squashfs-root/usr/share/applications
  sed -i -E "s|MimeType=text/plain;|MimeType=text/plain;application/x-yaml;application/xml;|g" NotepadNext.desktop
}

package() {
  cd squashfs-root
  install -Dm644 usr/share/icons/hicolor/scalable/apps/NotepadNext.svg -t "$pkgdir/usr/share/icons/hicolor/scalable/apps"
  install -Dm644 usr/share/applications/NotepadNext.desktop -t "$pkgdir/usr/share/applications"
  install -Dm755 usr/bin/NotepadNext -t "$pkgdir/usr/bin"
  ln -s /usr/bin/NotepadNext "$pkgdir/usr/bin/notepadnext"
}
