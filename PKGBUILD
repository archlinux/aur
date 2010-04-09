# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgbase=gtkmm
pkgname=('gtkmm' 'gtkmm-docs')
pkgver=2.20.1
pkgrel=1
arch=('i686' 'x86_64')
makedepends=('gtk2>=2.20.0' 'pangomm>=2.26.0' 'glibmm>=2.24.0')
license=('LGPL')
options=('!libtool' '!emptydirs')
url="http://gtkmm.sourceforge.net/"
source=(http://ftp.gnome.org/pub/GNOME/sources/${pkgbase}/2.20/${pkgbase}-${pkgver}.tar.bz2)
sha256sums=('95cd50b507cdd650b4b4232c5f4b2abb8ba523568dd6e62e8a2add62d8c723a1')

build() {
  cd "${srcdir}/${pkgbase}-${pkgver}"
  ./configure --prefix=/usr || return 1
  make || return 1
}

package_gtkmm() {
  pkgdesc="C++ bindings for gtk2"
  depends=('gtk2>=2.20.0' 'pangomm>=2.26.0' 'glibmm>=2.22.1')
  cd "${srcdir}/${pkgbase}-${pkgver}"
  sed -i -e 's/^doc_subdirs/#doc_subdirs/' Makefile
  make DESTDIR="${pkgdir}" install || return 1
}

package_gtkmm-docs() {
  pkgdesc="Developer documentation for gtkmm"
  cd "${srcdir}/${pkgbase}-${pkgver}/docs"
  make DESTDIR="${pkgdir}" install || return 1
}
