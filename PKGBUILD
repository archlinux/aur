# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix

pkgname=polo
pkgrel=1
pkgver=18.3
_channel=beta
pkgdesc="A modern, light-weight GTK file manager for Linux,  currently in beta"
arch=('i686' 'x86_64')
url="http://www.teejeetech.in/"
license=('GPL2')
depends=('gtk3' 'libgee' 'libsoup' 'vte3' 'rsync' 'gvfs' 'p7zip')
makedepends=('vala' 'chrpath')
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
source=(https://github.com/teejee2008/polo/archive/v${pkgver}-${_channel}.tar.gz)
md5sums=('68a0d95d1ff3b3b7b267d3fe04f15618')

build() {
  cd $srcdir/${pkgname}-${pkgver}-${_channel}
  make
}

package() {
  cd $srcdir/${pkgname}-${pkgver}-${_channel}
  make DESTDIR=$pkgdir install

  chrpath --delete ${pkgdir}/usr/bin/polo-gtk
  ln -s /usr/bin/polo-gtk $pkgdir/usr/bin/polo
  rm $pkgdir/usr/bin/polo-uninstall
}
