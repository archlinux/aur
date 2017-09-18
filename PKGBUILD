# Maintainer: Fabio Loli <loli_fabio@protonmail.com>
# Co-Maintainer: now-im <now.im.627@gmail.com>
# https://github.com/FabioLolix

pkgname=polo-bin
_name=polo-file-manager
pkgver=17.9
_channel=beta.10
pkgrel=1
pkgdesc="A modern, light-weight GTK file manager for Linux, currently in beta (.deb binary version)"
arch=('i686' 'x86_64')
url="http://www.teejeetech.in/"
license=('GPL2')
depends=('gtk3' 'libgee' 'vte3' 'libsoup' 'rsync' 'rclone' 'gvfs')
makedepends=('chrpath')
optdepends=('mediainfo: read media properties from audio and video files'
            'fish: terminal shell'
            'perl-image-exiftool: read EXIF properties from JPG/TIFF/PNG/PDF files'
            'pv: get progress info for compression and extraction'
            'ffmpeg: generate thumbnails for video'
            'p7zip: read and extract multiple archive formats'
            'gnome-disk-utility'
            'lzop'
            'polo-donation-plugins')
provides=('polo')
conflicts=('polo' 'polo-bin')
source_i686=("https://github.com/teejee2008/polo/releases/download/v${pkgver}-${_channel}/${_name}-v${pkgver}.1-${_channel}-i386.deb")
source_x86_64=("https://github.com/teejee2008/polo/releases/download/v${pkgver}-${_channel}/${_name}-v${pkgver}.1-${_channel}-amd64.deb")
sha256sums_i686=('775bd8af3d0ecc03f2d9faca95fc48d56dda00828fcb680f4a1e46f201307717')
sha256sums_x86_64=('303553ad851adc5d2cb75014ccc2b62ace2a787588261a8e3b2d266a75a252d4')

package() {
  bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}/"
  install -d $pkgdir/usr/bin
  ln -s /usr/bin/polo-gtk $pkgdir/usr/bin/polo
  rm $pkgdir/usr/bin/polo-uninstall
  chrpath --delete ${pkgdir}/usr/bin/polo-gtk
}
