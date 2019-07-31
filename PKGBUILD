# Maintainer: twa022 <twa022 at gmail dot com>

_pkgname=tumbler
pkgname=${_pkgname}-devel
pkgver=0.2.6
pkgrel=1
pkgdesc="D-Bus service for applications to request thumbnails"
arch=('i686' 'x86_64')
url="https://www.xfce.org/"
license=('GPL2' 'LGPL')
groups=('xfce4-devel')
depends=('gdk-pixbuf2')
makedepends=('intltool' 'python' 'ffmpegthumbnailer' 'poppler-glib' 'libgsf'
             'libopenraw' 'freetype2')
optdepends=('ffmpegthumbnailer: for video thumbnails'
            'poppler-glib: for PDF thumbnails'
            'libgsf: for ODF thumbnails'
            'libopenraw: for RAW thumbnails'
            'freetype2: for font thumbnails')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
source=("https://archive.xfce.org/src/xfce/$_pkgname/${pkgver%.*}/$_pkgname-$pkgver.tar.bz2")
sha256sums=('74d21781fb0c1e8c11ac803cc5afb469893a0b220721fdc25660c54891a10fa0')

prepare() {
  cd "$srcdir/$_pkgname-$pkgver"
}

build() {
  cd "$srcdir/$_pkgname-$pkgver"

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
  cd "$srcdir/$_pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
