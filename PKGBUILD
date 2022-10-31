# Maintainer: twa022 <twa022 at gmail dot com>

_pkgname=tumbler
pkgname=${_pkgname}-devel
pkgver=4.17.3
pkgrel=1
pkgdesc="D-Bus service for applications to request thumbnails"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://docs.xfce.org/xfce/tumbler/start"
license=('GPL2' 'LGPL')
groups=('xfce4-devel')
depends=('gdk-pixbuf2' 'libxfce4util>=4.17.1')
makedepends=('intltool' 'python' 'ffmpegthumbnailer' 'poppler-glib' 'libgsf'
             'libopenraw' 'freetype2' 'libgepub')
optdepends=('ffmpegthumbnailer: for video thumbnails'
            'poppler-glib: for PDF thumbnails'
            'libgsf: for ODF thumbnails'
            'libopenraw: for RAW thumbnails'
            'freetype2: for font thumbnails'
            'libgepub: for epub thumbnails')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
source=("https://archive.xfce.org/src/xfce/${_pkgname}/${pkgver%.*}/${_pkgname}-${pkgver}.tar.bz2")
sha256sums=('61181220ca5cfcf50112af2c5047f14154944a9253a697062d42e99203638821')

build() {
  cd "${_pkgname}-${pkgver}"

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib/xfce4 \
    --disable-static \
    --disable-debug \
    --disable-gstreamer-thumbnailer
  make
}

package() {
  cd "${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
