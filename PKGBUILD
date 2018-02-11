# Maintainer: Fabio Loli <loli_fabio@protonmail.com>
# Co-Maintainer: now-im <now.im.627 gmail com>
# https://github.com/FabioLolix

pkgname=polo-bin
_name=polo-file-manager
pkgver=18.2
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
source_i686=("https://github.com/teejee2008/polo/releases/download/v${pkgver}-${_channel}/${_name}-v${pkgver}-i386.deb")
source_x86_64=("https://github.com/teejee2008/polo/releases/download/v${pkgver}-${_channel}/${_name}-v${pkgver}-amd64.deb")

sha256sums_i686=('40bf6a1ea2e9041c34836d53114f0a3ab1e5cdffc577f1dea2befaf1b20dd3ab')
sha256sums_x86_64=('ec4a3e2c40c0271044c9e42a1d1400a72e5d99dd6e0eeba4e778eb7e5eda10e2')

package() {
  bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}/"
  install -d $pkgdir/usr/bin
  ln -s /usr/bin/polo-gtk $pkgdir/usr/bin/polo
  rm $pkgdir/usr/bin/polo-uninstall
  chrpath --delete ${pkgdir}/usr/bin/polo-gtk
}
