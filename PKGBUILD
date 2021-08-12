pkgname=tkblt
pkgver=3.2.23
pkgrel=1
pkgdesc="Adds a new command (vector) and widgets (graph and barchart) to the Tcl interpreter."
url="https://github.com/wjoye/tkblt"
license=("BSD")
depends=('tk')
conflicts=('blt_tcl85' 'blt')
arch=('i686' 'x86_64')
source=("${pkgname}-${pkgver}.zip::https://github.com/wjoye/tkblt/archive/V${pkgver}.zip")
sha256sums=('66b14c32eebf2c7289b49cbb555fa24d83980516719fe24a3166bc78e693759f')

build() {
  # configure
  cd ${srcdir}/${pkgname}-${pkgver}

  ./configure \
    --prefix=/usr \
    --with-tcl=/usr/lib \
    --with-x --x-includes=/usr/include \
    --x-libraries=/usr/lib \
    --mandir=/usr/share/man

  # Compile
  make
}

package() {
  # Fix for the man directory
  mkdir -p ${pkgdir}/usr/share/man

  cd ${srcdir}/${pkgname}-${pkgver}
  make -j 1 DESTDIR=${pkgdir} install
  rm ${pkgdir}/usr/lib/tkbltConfig.sh
}
