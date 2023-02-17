# Maintainer: Nick <wirlaburla@worlio.com>
# Contibutor: arojas <arojas@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: damir <damir@archlinux.org>

pkgname=libvisual-plugins
pkgver=0.4.1
pkgrel=1
pkgdesc="plugins for libvisual"
arch=("x86_64")
license=('GPL')
url="https://sourceforge.net/projects/libvisual/"
depends=('libvisual' 'glu' 'alsa-lib' 'jack' 'gdk-pixbuf2')
makedepends=('mesa' 'gtk2')
source=(https://downloads.sourceforge.net/sourceforge/libvisual/libvisual-plugins-${pkgver}.tar.bz2)
sha256sums=('dca8512cde37b7691afac05c1a67f4de82a3cfc7b7c5cc35e7d959753b1db107')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  autoreconf -fi

  ./configure --prefix=/usr \
      --disable-gstreamer-plugin \
      --disable-gforce \
      --disable-esd
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
