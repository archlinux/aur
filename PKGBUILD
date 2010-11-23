# Contributor: Jan de Groot <jan@jgc.homeip.net>

pkgbase=libgdamm
pkgname=(libgdamm libgdamm-docs)
pkgver=4.1.1
pkgrel=1
arch=('i686' 'x86_64')
makedepends=('libgda>=4.2.1' 'libsigc++' 'glibmm>=2.24.2' 'glibmm-docs>=2.24.2')
url="http://gtkmm.sourceforge.net/"
license=('LGPL')
options=('!libtool' '!emptydirs')
source=(http://ftp.gnome.org/pub/GNOME/sources/$pkgbase/${pkgver%.*}/$pkgname-$pkgver.tar.bz2)
md5sums=('6f57b0362698420cd855539cf61be388')

build() {
  cd "${srcdir}/${pkgbase}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package_libgdamm() {
  pkgdesc="C++ bindings for libgda"
  depends=('libgda>=4.2.1' 'glibmm>=2.24.2' 'libsigc++')
  cd "${srcdir}/${pkgbase}-${pkgver}"

  sed -i -e 's/^doc_subdirs/#doc_subdirs/' Makefile

  make DESTDIR="${pkgdir}" install
}

package_libgdamm-docs() {
  pkgdesc="Developer documentation for libgdamm"

  cd "${srcdir}/${pkgbase}-${pkgver}"
  make -C docs DESTDIR="${pkgdir}" install
}
