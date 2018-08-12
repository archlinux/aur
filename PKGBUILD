# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix

pkgname=polo-git
pkgrel=1
pkgver=18.8.beta.r0.g302c071
pkgdesc="A modern, light-weight GTK file manager for Linux,  currently in beta"
arch=('i686' 'x86_64')
url="https://teejee2008.github.io/polo/"
license=('GPL2')
depends=('gtk3' 'libgee' 'libsoup' 'vte3' 'rsync' 'gvfs' 'p7zip')
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
provides=('polo')
conflicts=('polo' 'polo-bin')
source=("${pkgname}::git+https://github.com/teejee2008/polo.git"
        '0001-Re-add-support-for-vte291-0.52.patch')
sha256sums=('SKIP'
            '4ae33547220a7bfb7cd9806bd121acbc54c35a06958d40aa3cb1621688b5f69f')

pkgver() {
  cd "${pkgname}"
  git describe --long --tags | sed 's/v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname}"
  patch -Np1 -i ../0001-Re-add-support-for-vte291-0.52.patch
}

build() {
  cd "${pkgname}"
  make
}

package() {
  cd "${pkgname}"
  make DESTDIR="${pkgdir}" install

  ln -s /usr/bin/polo-gtk "${pkgdir}"/usr/bin/polo
  rm "${pkgdir}"/usr/bin/polo-uninstall
}
