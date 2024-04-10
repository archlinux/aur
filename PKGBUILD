# Maintainer: Nick <wirlaburla@worlio.com>
# Contibutor: arojas <arojas@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: damir <damir@archlinux.org>

pkgname=libvisual-plugins
pkgver=0.4.2
pkgrel=1
pkgdesc="plugins for libvisual"
arch=("x86_64")
license=('GPL')
url="https://github.com/Libvisual/libvisual"
depends=('libvisual' 'glu' 'alsa-lib' 'jack' 'gdk-pixbuf2')
makedepends=('mesa' 'gtk2')
source=("${url}/releases/download/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('a1dd04eb3d311d68b4f43a5c707df7aba7a98a9cab820c58395a7f5d7d6d0157')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  autoreconf -fi

  ./configure --prefix=/usr
#      --disable-gstreamer-plugin \
#      --disable-gforce
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
