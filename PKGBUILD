# Maintainer: dekart811 <mail@dekart811.net>

pkgname=arkha-bin
_pkgname=arkha
pkgver=1.0.1
pkgrel=1
pkgdesc='A fast graphical file manager (prebuilt binary)'
arch=('x86_64')
url='https://github.com/dekart811/arkha'
license=('GPL-3.0-or-later')
depends=(
  'at-spi2-core'
  'cairo'
  'gdk-pixbuf2'
  'glib2'
  'glibc'
  'gtk3'
  'gvfs'
  'hicolor-icon-theme'
  'libgcc'
  'pango'
)
optdepends=(
  'ffmpegthumbnailer: video thumbnails'
  'ffmpeg: video thumbnails without ffmpegthumbnailer'
  'mediainfo: the Media Info tab in Properties'
  'gvfs-mtp: phones and media players over MTP'
  'gvfs-gphoto2: cameras'
  'gvfs-smb: Windows and Samba network shares'
  'engrampa: creating and extracting archives'
  'file-roller: creating and extracting archives'
  'xarchiver: creating and extracting archives'
  'xterm: Open in Terminal, if no other terminal is installed'
)
provides=("$_pkgname")
conflicts=("$_pkgname")
# The program comes stripped: there's nothing for a -debug package.
options=('!debug')
# The release's prebuilt program: arkha-<version>-<arch>/ with arkha (runs
# from there too), arkha.desktop, arkha.svg, the AppStream metainfo,
# locale/, LICENSE and README.md. The checksum is set for each release (updpkgsums, then
# makepkg --printsrcinfo > .SRCINFO).
source_x86_64=("$url/releases/download/v$pkgver/$_pkgname-$pkgver-x86_64.tar.gz")
sha256sums_x86_64=('507894708c6ab249c9180ca7cc5201bd39a3d697ce0a615eb07816931db91352')

package() {
  cd "$_pkgname-$pkgver-$CARCH"
  install -Dm755 arkha "$pkgdir/usr/bin/arkha"
  install -Dm644 arkha.desktop "$pkgdir/usr/share/applications/arkha.desktop"
  install -Dm644 arkha.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/arkha.svg"
  install -Dm644 io.github.dekart811.Arkha.metainfo.xml "$pkgdir/usr/share/metainfo/io.github.dekart811.Arkha.metainfo.xml"
  for mo in locale/*/LC_MESSAGES/arkha.mo; do
    install -Dm644 "$mo" "$pkgdir/usr/share/$mo"
  done
  install -Dm644 README.md "$pkgdir/usr/share/doc/$_pkgname/README.md"
}
