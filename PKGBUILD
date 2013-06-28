# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgbase=gtkmm
pkgname=('gtkmm' 'gtkmm-docs')
pkgver=2.24.4
pkgrel=1
arch=('i686' 'x86_64')
makedepends=('gtk2' 'pangomm' 'atkmm' 'glibmm-docs')
license=('LGPL')
options=('!libtool' '!emptydirs')
url="http://www.gtkmm.org/"
source=(http://ftp.gnome.org/pub/GNOME/sources/${pkgbase}/2.24/${pkgbase}-${pkgver}.tar.xz)
sha256sums=('443a2ff3fcb42a915609f1779000390c640a6d7fd19ad8816e6161053696f5ee')

build() {
  cd "${srcdir}/${pkgbase}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package_gtkmm() {
  pkgdesc="C++ bindings for gtk2"
  depends=('gtk2' 'pangomm' 'atkmm')
  cd "${srcdir}/${pkgbase}-${pkgver}"

  sed -i -e 's/^doc_subdirs/#doc_subdirs/' Makefile

  make DESTDIR="${pkgdir}" install
}

package_gtkmm-docs() {
  pkgdesc="Developer documentation for gtkmm v2"

  cd "${srcdir}/${pkgbase}-${pkgver}"
  make -C docs DESTDIR="${pkgdir}" install
}
