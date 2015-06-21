# Maintainer: Gicu Gorodenco <cyclopsihus 'at' gmail 'dot' com>
# Contributor: josephgbr
_pkgbasename=gtkmm
pkgname=lib32-$_pkgbasename
pkgver=2.24.4
pkgrel=1
pkgdesc="C++ bindings for gtk2 (32 bit, library only)"
arch=('x86_64')
url="http://gtkmm.sourceforge.net/"
license=('LGPL')
depends=('lib32-gtk2' 'lib32-pangomm' 'lib32-atkmm' "${_pkgbasename}")
makedepends=('gcc-multilib')
options=('!libtool' '!emptydirs')
source=(http://ftp.gnome.org/pub/GNOME/sources/${_pkgbasename}/2.24/${_pkgbasename}-${pkgver}.tar.xz)
sha256sums=('443a2ff3fcb42a915609f1779000390c640a6d7fd19ad8816e6161053696f5ee')

build() {
  cd "${srcdir}/${_pkgbasename}-${pkgver}"
  ./configure --prefix=/usr --libdir=/usr/lib32 CXX='g++ -m32'
  make
}

package() {
  cd "${srcdir}/${_pkgbasename}-${pkgver}"
  sed -i -e 's/^doc_subdirs/#doc_subdirs/' Makefile
  make DESTDIR="${pkgdir}" install
  # Cleanup for a lib32 package
  rm -rf ${pkgdir}/usr/include
}
