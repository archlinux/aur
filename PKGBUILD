# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=shared-mime-info
pkgver=0.90
pkgrel=1
pkgdesc="Freedesktop.org Shared MIME Info"
arch=('i686' 'x86_64')
license=('GPL')
depends=('libxml2>=2.7.7' 'glib2>=2.26.0')
makedepends=('intltool' 'pkgconfig')
install=shared-mime-info.install
url="http://freedesktop.org/Software/shared-mime-info"
source=(http://freedesktop.org/~hadess/${pkgname}-${pkgver}.tar.bz2
        pbm.patch)
md5sums=('967d68d3890ba3994cfce3adf5b8f15b'
         '39fcc08fbd33145684ba97f1f64644c2')
options=(!makeflags)

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -p1 -i "${srcdir}/pbm.patch"
  ./configure --prefix=/usr --disable-update-mimedb
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
