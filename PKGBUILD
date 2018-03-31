# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix
# Maintainer: now-im <now.im.627 gmail com>

pkgname=polo-bin
_name=polo-file-manager
pkgver=18.3
_pkgver2=18.3.1
_channel=beta
pkgrel=1
pkgdesc="A modern, light-weight GTK file manager for Linux, currently in beta (.deb binary version)"
arch=('i686' 'x86_64')
url="https://teejee2008.github.io/polo/"
license=('GPL2')
depends=('gtk3' 'libgee' 'libsoup' 'vte3' 'rsync' 'gvfs' 'p7zip')
makedepends=('chrpath')
optdepends=('mediainfo: read media properties from audio and video files'
            'fish: terminal shell'
            'perl-image-exiftool: read EXIF properties from JPG/TIFF/PNG/PDF files'
            'pv: get progress info for compression and extraction'
            'ffmpeg: generate thumbnails for video'
            'rclone: cloud storage accounts support'
            'gnome-disk-utility'
            'lzop'
            'polo-donation-plugins')
provides=('polo')
conflicts=('polo' 'polo-bin')
source_i686=("https://github.com/teejee2008/polo/releases/download/v${pkgver}-${_channel}/${_name}-v${_pkgver2}-i386.deb")
source_x86_64=("https://github.com/teejee2008/polo/releases/download/v${pkgver}-${_channel}/${_name}-v${_pkgver2}-amd64.deb")

sha256sums_i686=('b8ba3b9bcb70ce82a9ff3d899297daefeb58599b97800d285294f393b331501c')
sha256sums_x86_64=('27fb082c2c410f48f22e44e05dbe27ce2d1accb8ce72120581046fb9e37cbdca')

package() {
  bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}/"
  install -d $pkgdir/usr/bin
  ln -s /usr/bin/polo-gtk $pkgdir/usr/bin/polo
  rm $pkgdir/usr/bin/polo-uninstall
  chrpath --delete ${pkgdir}/usr/bin/polo-gtk
}
