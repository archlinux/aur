# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix

pkgname=polo-git
pkgrel=1
pkgver=18.8.beta.r28.g173d4e6
pkgdesc="A modern, light-weight GTK file manager for Linux,  currently in beta"
arch=(i686 x86_64)
url="https://teejee2008.github.io/polo/"
license=(GPL2)
depends=(gtk3 libgee libsoup vte3 rsync gvfs p7zip)
makedepends=(vala git)
optdepends=('mediainfo: read media properties from audio and video files'
            'fish: terminal shell'
            'perl-image-exiftool: read EXIF properties from JPG/TIFF/PNG/PDF files'
            'pv: get progress info for compression and extraction'
            'ffmpeg: generate thumbnails for video'
            'rclone: cloud storage accounts support'
            'gnome-disk-utility'
            'lzop'
            'polo-donation-plugins')
provides=(polo)
conflicts=(polo)
source=("git+https://github.com/teejee2008/polo.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname/-git/}"
  git describe --long --tags | sed 's/v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/${pkgname/-git/}"
  make
}

package() {
  cd "$srcdir/${pkgname/-git/}"
  make DESTDIR="${pkgdir}" install

  ln -s /usr/bin/polo-gtk "${pkgdir}"/usr/bin/polo
  rm "${pkgdir}"/usr/bin/polo-uninstall
}
