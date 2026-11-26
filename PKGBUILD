# Maintainer: Radhey Kalra <radheykalra901@gmail.com>
pkgname=boxbox-bin
pkgver=0.4.0
pkgrel=1
pkgdesc='Native Linux file manager for local files and self-hosted BoxBox servers'
arch=('x86_64')
url='https://github.com/jR4dh3y/BoxBox'
license=('MIT')
depends=('gcc-libs' 'glibc' 'libxcb' 'libxkbcommon' 'libxkbcommon-x11'
         'vulkan-icd-loader' 'wayland' 'fontconfig' 'freetype2' 'glib2'
         'xdg-utils' 'hicolor-icon-theme')
optdepends=('udisks2: disks and removable drives in the sidebar'
            'gvfs: phones and network locations'
            'gvfs-smb: SMB shares'
            'gvfs-mtp: phones over MTP'
            'xclip: X11 file clipboard'
            'ffmpeg: video thumbnails'
            'poppler: PDF thumbnails')
provides=('boxbox')
conflicts=('boxbox')
options=('!debug')
_archive_sha256=3e896bac170bbc82b752d84bca569ecc351d8a63b1a10c6c97b4d89eb0d71359
source=("$url/releases/download/v$pkgver/boxbox-desktop-v$pkgver-linux-amd64.tar.gz")
sha256sums=("$_archive_sha256")

package() {
  cd "boxbox-desktop-v$pkgver-linux-amd64"
  install -Dm755 boxbox "$pkgdir/usr/bin/boxbox"
  install -dm755 "$pkgdir/usr/share/applications"
  sed 's|@EXEC@|/usr/bin/boxbox|' io.boxbox.desktop > "$pkgdir/usr/share/applications/io.boxbox.desktop"
  for size in 16 24 32 48 64 128 256 512; do
    install -Dm644 "icons/$size.png" "$pkgdir/usr/share/icons/hicolor/${size}x$size/apps/io.boxbox.desktop.png"
  done
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
