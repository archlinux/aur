# Maintainer: Fabio Loli <loli_fabio@protonmail.com>
# Co-Maintainer: now-im <now.im.627 gmail com>
# https://github.com/FabioLolix

pkgname=polo-bin
_name=polo-file-manager
pkgver=17.10
_channel=beta
pkgrel=1
pkgdesc="A modern, light-weight GTK file manager for Linux, currently in beta (.deb binary version)"
arch=('i686' 'x86_64')
url="http://www.teejeetech.in/"
license=('GPL2')
depends=('gtk3' 'libgee' 'vte3' 'libsoup' 'rsync' 'rclone' 'gvfs' 'p7zip')
makedepends=('chrpath')
optdepends=('mediainfo: read media properties from audio and video files'
            'fish: terminal shell'
            'perl-image-exiftool: read EXIF properties from JPG/TIFF/PNG/PDF files'
            'pv: get progress info for compression and extraction'
            'ffmpeg: generate thumbnails for video'
            'gnome-disk-utility'
            'lzop'
            'polo-donation-plugins')
provides=('polo')
conflicts=('polo' 'polo-bin')
source_i686=("https://github.com/teejee2008/polo/releases/download/v${pkgver}-${_channel}/${_name}-v${pkgver}-${_channel}-i386.deb")
source_x86_64=("https://github.com/teejee2008/polo/releases/download/v${pkgver}-${_channel}/${_name}-v${pkgver}-${_channel}-amd64.deb")
sha256sums_i686=('fb4b38c3b6728e1f67666de73125b6ece9fdd663d5ce12bf91df25ee73b08deb')
sha256sums_x86_64=('6a81bbf2461ac45646d7661e6a0bb775824bffdc77d1e45b0aa17541ab25b6a4')

package() {
  bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}/"
  install -d $pkgdir/usr/bin
  ln -s /usr/bin/polo-gtk $pkgdir/usr/bin/polo
  rm $pkgdir/usr/bin/polo-uninstall
  chrpath --delete ${pkgdir}/usr/bin/polo-gtk
}
