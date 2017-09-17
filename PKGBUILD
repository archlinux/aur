# Maintainer: Fabio Loli <loli_fabio@protonmail.com>
# https://github.com/FabioLolix

pkgname=polo
pkgrel=1
pkgver=17.9
_channel=beta.10
pkgdesc="A modern, light-weight GTK file manager for Linux,  currently in beta"
arch=('i686' 'x86_64')
url="http://www.teejeetech.in/"
license=('GPL2')
depends=('gtk3' 'libgee' 'libsoup' 'vte3' 'rsync' 'gvfs' 'rclone')
makedepends=('vala' 'chrpath')
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
source=(https://github.com/teejee2008/polo/archive/v${pkgver}-${_channel}.tar.gz)
md5sums=('c433342831bebf6f98ae7250e23d894e')

package() {
  cd $srcdir/${pkgname}-${pkgver}-${_channel}
  make
  make DESTDIR=$pkgdir install

  chrpath --delete ${pkgdir}/usr/bin/polo-gtk
  ln -s /usr/bin/polo-gtk $pkgdir/usr/bin/polo
  rm $pkgdir/usr/bin/polo-uninstall
}
