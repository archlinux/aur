# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix

pkgname=polo
pkgrel=1
pkgver=18.8
_channel=beta
pkgdesc="A modern, light-weight GTK file manager for Linux,  currently in beta"
arch=('i686' 'x86_64')
url="https://teejee2008.github.io/polo/"
license=('GPL2')
depends=('gtk3' 'libgee' 'libsoup' 'vte3' 'rsync' 'gvfs' 'p7zip')
makedepends=('vala')
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
source=("${pkgname}-${pkgver}-${_channel}.tar.gz::https://github.com/teejee2008/polo/archive/v${pkgver}-${_channel}.tar.gz"
        '0001-Re-add-support-for-vte291-0.52.patch')
sha256sums=('1112469c2107ac1ed08d1f2f966d7ee21baff773ff56dc56c137eaef2468515f'
            '4ae33547220a7bfb7cd9806bd121acbc54c35a06958d40aa3cb1621688b5f69f')

prepare() {
  cd "$srcdir/${pkgname}-${pkgver}-${_channel}"
  patch -Np1 -i ../0001-Re-add-support-for-vte291-0.52.patch
}

build() {
  cd "$srcdir/${pkgname}-${pkgver}-${_channel}"
  make
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}-${_channel}"
  make DESTDIR="${pkgdir}" install

  ln -s /usr/bin/polo-gtk "${pkgdir}"/usr/bin/polo
  rm "${pkgdir}"/usr/bin/polo-uninstall
}
