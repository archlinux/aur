# Maintainer: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Jan Jezek <honzin.jezek@gmail.com>

pkgname=tumbler
pkgver=0.2.4
pkgrel=1
pkgdesc="D-Bus service for applications to request thumbnails"
arch=('x86_64')
url="https://www.xfce.org/"
license=('GPL2' 'LGPL')
groups=('xfce4')
depends=('gdk-pixbuf2')
makedepends=('intltool' 'python' 'ffmpegthumbnailer' 'poppler-glib' 'libgsf'
             'libopenraw' 'freetype2')
optdepends=('ffmpegthumbnailer: for video thumbnails'
            'poppler-glib: for PDF thumbnails'
            'libgsf: for ODF thumbnails'
            'libopenraw: for RAW thumbnails'
            'freetype2: for font thumbnails')
source=(https://archive.xfce.org/src/xfce/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.bz2)
sha256sums=('0ff497e13f9f9322112cb7707918dd8970e405447f0c92dac40ec3d659e5b6a6')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"

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
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
