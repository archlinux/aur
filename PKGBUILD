# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgbase=gtkmm
pkgname=('gtkmm' 'gtkmm-docs')
pkgver=2.24.2
pkgrel=1
arch=('i686' 'x86_64')
makedepends=('gtk2' 'pangomm' 'atkmm' 'glibmm-docs')
license=('LGPL')
options=('!libtool' '!emptydirs')
url="http://gtkmm.sourceforge.net/"
source=(http://ftp.gnome.org/pub/GNOME/sources/${pkgbase}/2.24/${pkgbase}-${pkgver}.tar.xz)
sha256sums=('c90c7a29c20dd6d795925bd66ad1ff40be07cea0e4c03f4d6105a8c07448953d')

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
