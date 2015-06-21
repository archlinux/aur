# Maintainer: Gicu Gorodenco <cyclopsihus 'at' gmail 'dot' com>
# Contributor: rafael ff1 (aka josephgbr)
_pkgbasename=libsigc++
pkgname=lib32-$_pkgbasename
pkgver=2.4.1
pkgrel=1
pkgdesc="Libsigc++ implements a full callback system for use in widget libraries - V2 (32 bit)"
arch=('x86_64')
url="http://libsigc.sourceforge.net/"
license=('LGPL')
depends=("$_pkgbasename")
makedepends=('gcc-multilib')
options=(!libtool !emptydirs)
source=(http://ftp.gnome.org/pub/GNOME/sources/${_pkgbasename}/${pkgver:0:3}/${_pkgbasename}-${pkgver}.tar.xz)
sha256sums=('540443492a68e77e30db8d425f3c0b1299c825bf974d9bfc31ae7efafedc19ec')

build() {
  cd "${srcdir}/${_pkgbasename}-${pkgver}"
  ./configure --prefix=/usr --libdir=/usr/lib32 CXX='g++ -m32'
  make
}

package() {
  cd "${srcdir}/${_pkgbasename}-${pkgver}"
  sed -i -e 's/^doc_subdirs/#doc_subdirs/' Makefile
  make DESTDIR="${pkgdir}" install
  rm -rf ${pkgdir}/usr/include
}
