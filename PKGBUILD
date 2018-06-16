# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix

pkgname=polo
pkgrel=1
pkgver=18.6
_channel=beta
pkgdesc="A modern, light-weight GTK file manager for Linux,  currently in beta"
arch=('i686' 'x86_64')
url="https://teejee2008.github.io/polo/"
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
source=("https://github.com/teejee2008/polo/archive/v${pkgver}-${_channel}.tar.gz"
        '0001-Fixed-build-with-recent-vala-version.patch')
sha256sums=('38ce401f607af3e77b3cd099efc6aea73410361d35771be3563b0f99f147a352'
            '97d78f7879eb913dc4b9574e6854553e956f5a883beef2335887d1d12061d0b2')

prepare() {
  cd "$srcdir/${pkgname}-${pkgver}-${_channel}"
  patch -Np1 -i ../0001-Fixed-build-with-recent-vala-version.patch
}

build() {
  cd "$srcdir/${pkgname}-${pkgver}-${_channel}"
  make
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}-${_channel}"
  make DESTDIR="${pkgdir}" install

  chrpath --delete "${pkgdir}"/usr/bin/polo-gtk
  ln -s /usr/bin/polo-gtk "${pkgdir}"/usr/bin/polo
  rm "${pkgdir}"/usr/bin/polo-uninstall
}
