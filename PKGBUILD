# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgbase=gtkmm
pkgname=('gtkmm' 'gtkmm-docs')
pkgver=2.22.0
pkgrel=1
arch=('i686' 'x86_64')
makedepends=('gtk2>=2.22.1' 'pangomm>=2.26.2' 'atkmm>=2.22.1' 'glibmm-docs>=2.24.2')
license=('LGPL')
options=('!libtool' '!emptydirs')
url="http://gtkmm.sourceforge.net/"
source=(http://ftp.gnome.org/pub/GNOME/sources/${pkgbase}/2.22/${pkgbase}-${pkgver}.tar.bz2)
sha256sums=('8478d80d8d4793c2e1c459a71bad6a767a43eaf2664da06a9bd65a2b98bb07b1')

build() {
  cd "${srcdir}/${pkgbase}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package_gtkmm() {
  pkgdesc="C++ bindings for gtk2"
  depends=('gtk2>=2.22.1' 'pangomm>=2.26.2' 'atkmm>=2.22.1')
  cd "${srcdir}/${pkgbase}-${pkgver}"

  sed -i -e 's/^doc_subdirs/#doc_subdirs/' Makefile

  make DESTDIR="${pkgdir}" install
}

package_gtkmm-docs() {
  pkgdesc="Developer documentation for gtkmm"

  cd "${srcdir}/${pkgbase}-${pkgver}"
  make -C docs DESTDIR="${pkgdir}" install
}
