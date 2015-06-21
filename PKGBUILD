# Maintainer: Gicu Gorodenco <cyclopsihus 'at' gmail 'dot' com>
# Contributor: josephgbr
_pkgbasename=pangomm
pkgname=lib32-$_pkgbasename
pkgver=2.36.0
pkgrel=1
pkgdesc="C++ bindings for pango (32 bit, library only)"
arch=('x86_64')
url="http://gtkmm.sourceforge.net/"
license=('LGPL')
depends=('lib32-pango' 'lib32-glibmm' 'lib32-cairomm')
makedepends=('gcc-multilib')
options=('!libtool')
source=(http://ftp.gnome.org/pub/GNOME/sources/${_pkgbasename}/${pkgver::4}/${_pkgbasename}-${pkgver}.tar.xz)
sha256sums=('a8d96952c708d7726bed260d693cece554f8f00e48b97cccfbf4f5690b6821f0')

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
