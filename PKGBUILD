# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=polo
pkgver=18.8.3
pkgrel=2
pkgdesc="A modern, light-weight GTK file manager for Linux,  currently in beta"
arch=(686 x86_64)
url="https://teejee2008.github.io/polo/"
license=(GPL2)
depends=(gtk3 libgee libsoup vte3 rsync gvfs p7zip)
makedepends=(vala0.44)
optdepends=('mediainfo: read media properties from audio and video files'
            'fish: terminal shell'
            'perl-image-exiftool: read EXIF properties from JPG/TIFF/PNG/PDF files'
            'pv: get progress info for compression and extraction'
            'ffmpeg: generate thumbnails for video'
            'rclone: cloud storage accounts support'
            'gnome-disk-utility'
            'lzop'
            'polo-donation-plugins')
_commit=538be6950d9394c90aa90be3973a3c8d9a27b999
source=("${pkgname}-${pkgver}-${_commit}.tar.gz::https://github.com/teejee2008/polo/archive/${_commit}.tar.gz"
        "https://raw.githubusercontent.com/FabioLolix/AUR-artifacts/master/polo-Re-add-support-for-vte291-0.52.patch"
        "https://raw.githubusercontent.com/FabioLolix/AUR-artifacts/master/polo-fix-build.patch")
sha256sums=('ac96ad931024d7b96d5458f963753bf2bc92dc697dbfe5bb8bbc90aa98824443'
            '4ae33547220a7bfb7cd9806bd121acbc54c35a06958d40aa3cb1621688b5f69f'
            '895c7f21844fead0df7b044396ee972f55cd03e4cb5a218adc30e1605e274f45')

prepare() {
  cd "${pkgname}-${_commit}"
  patch -Np1 -i ../polo-Re-add-support-for-vte291-0.52.patch
  patch -Np1 -i ../polo-fix-build.patch
}

build() {
  cd "${pkgname}-${_commit}"
  make
}

package() {
  cd "${pkgname}-${_commit}"
  make DESTDIR="${pkgdir}" install

  ln -s /usr/bin/polo-gtk "${pkgdir}"/usr/bin/polo
  rm "${pkgdir}"/usr/bin/polo-uninstall
}
