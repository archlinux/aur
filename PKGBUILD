# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Dany Martineau <dany.luc.martineau gmail.com>

pkgname=morris
pkgver=0.2
pkgrel=2
pkgdesc="An implementation of the board game Nine Men's Morris"
arch=('i686' 'x86_64')
url="http://www.nine-mens-morris.net/index.html"
license=('GPL3')
depends=('boost-libs' 'gconf' 'gtk2')
makedepends=('boost')
source=("http://www.nine-mens-morris.net/data/${pkgname}-${pkgver}.tar.bz2")
md5sums=('3baa1684810f3f1990a8af10b48a96f8')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  sed -i "s_glib/gthread.h_glib.h_" src/gtk_appgui.cc
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install

  # Install documentation
  mkdir -p "${pkgdir}/usr/share/doc/${pkgname}"
  install -m644 AUTHORS README "${pkgdir}/usr/share/doc/${pkgname}"
}
