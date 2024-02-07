# Maintainer: twa022 <twa022 at gmail dot com>

_pkgname=tumbler
pkgname=${_pkgname}-devel
pkgver=4.19.1
pkgrel=1
pkgdesc="D-Bus service for applications to request thumbnails"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://docs.xfce.org/xfce/tumbler/start"
license=('GPL2' 'LGPL')
groups=('xfce4-devel')
depends=('gdk-pixbuf2' 'libxfce4util')
makedepends=('python' 'ffmpegthumbnailer' 'poppler-glib' 'libgsf'
             'libopenraw' 'freetype2' 'libgepub')
optdepends=('ffmpegthumbnailer: for video thumbnails'
            'poppler-glib: for PDF thumbnails'
            'libgsf: for ODF thumbnails'
            'libopenraw: for RAW thumbnails'
            'freetype2: for font thumbnails'
            'libgepub: for epub thumbnails')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
backup=('etc/xdg/tumbler/tumbler.rc')
source=("https://archive.xfce.org/src/xfce/${_pkgname}/${pkgver%.*}/${_pkgname}-${pkgver}.tar.bz2")
sha256sums=('0bf0ac7f84cc24c6582addc750282b7846d1b6f5998fa839b79b1b8f0eba9905')

build() {
  cd "${_pkgname}-${pkgver}"

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --disable-debug \
    --disable-gstreamer-thumbnailer
  make
}

package() {
  cd "${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
