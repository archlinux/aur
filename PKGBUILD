# Maintainer: Rémi BERTHO <remi.bertho@openmailbox.org>
# Contributor: damir <damir@archlinux.org>

pkgbase=libxml++3.0
pkgname=('libxml++3.0' 'libxml++3.0-docs')
pkgver=3.0.0
pkgrel=1
arch=('i686' 'x86_64')
license=('LGPL')
url="http://libxmlplusplus.sourceforge.net/"
makedepends=('pkgconfig' 'glibmm-docs' 'libxml2' 'glibmm')
options=('!emptydirs')
source=(http://ftp.gnome.org/pub/GNOME/sources/${pkgbase:0:8}/${pkgver:0:3}/${pkgbase:0:8}-${pkgver}.tar.xz)
sha256sums=('2ff3640417729d357bada2e3049061642e0b078c323a8e0d37ae68df96547952')

build() {
  cd "${srcdir}/${pkgbase:0:8}-${pkgver}"
  ./configure --prefix=/usr

  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package_libxml++3.0() {
  pkgdesc="C++ bindings to libxml2, 3.0 version"
  depends=('libxml2' 'glibmm')
  replaces=('libxml++3')
  provides=("libxml++3=${pkgver}")
  conflicts=('libxml++3')

  cd "${srcdir}/${pkgbase:0:8}-${pkgver}"
  make DESTDIR="${pkgdir}" install doc_subdirs=
}

package_libxml++3.0-docs() {
  pkgdesc="Developer documentation for libxml++3.0"
  depends=('glibmm-docs')
  cd "${srcdir}/${pkgbase:0:8}-${pkgver}"
  make DESTDIR="${pkgdir}" -C docs install
}
