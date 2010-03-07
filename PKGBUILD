# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgbase=gtkmm
pkgname=('gtkmm' 'gtkmm-docs')
pkgver=2.19.6
pkgrel=2
arch=('i686' 'x86_64')
makedepends=('gtk2>=2.19.6' 'pangomm>=2.26.0' 'glibmm>=2.22.1')
license=('LGPL')
options=('!libtool' '!emptydirs')
url="http://gtkmm.sourceforge.net/"
source=(http://ftp.gnome.org/pub/GNOME/sources/${pkgbase}/2.19/${pkgbase}-${pkgver}.tar.bz2)
sha256sums=('5d51071c0cb597778d3aa66245eace32449a0720ab7fae8b2cc5d59282389a7f')

build() {
  cd "${srcdir}/${pkgbase}-${pkgver}"
  ./configure --prefix=/usr || return 1
  make || return 1
}

package_gtkmm() {
  pkgdesc="C++ bindings for gtk2"
  depends=('gtk2>=2.19.6' 'pangomm>=2.26.0' 'glibmm>=2.22.1')
  cd "${srcdir}/${pkgbase}-${pkgver}"
  sed -i -e 's/^doc_subdirs/#doc_subdirs/' Makefile
  make DESTDIR="${pkgdir}" install || return 1
}

package_gtkmm-docs() {
  pkgdesc="Developer documentation for gtkmm"
  cd "${srcdir}/${pkgbase}-${pkgver}/docs"
  make DESTDIR="${pkgdir}" install || return 1
}
