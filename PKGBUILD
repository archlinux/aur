# Maintainer: Gicu Gorodenco <cyclopsihus 'at' gmail 'dot' com>
# Contributor: rafael ff1 <rafael.f.f1 'at' gmail 'dot' com> 
_pkgbasename=libgnomecanvasmm
pkgname=lib32-$_pkgbasename
pkgver=2.26.0
pkgrel=3
pkgdesc="A C++ wrapper for libgnomecanvas (32 bit, library only)"
arch=('x86_64')
url="http://gtkmm.sourceforge.net/"
license=('LGPL')
depends=('lib32-gtkmm>=2.16.0' 'lib32-libgnomecanvas>=2.26.0' "$_pkgbasename")
makedepends=('pkgconfig' 'gcc-multilib')
options=('!libtool')
source=(http://ftp.gnome.org/pub/gnome/sources/${_pkgbasename}/2.26/${_pkgbasename}-${pkgver}.tar.bz2)
md5sums=('a148c99311d46397de6e4a31736771ab')

build() {
  cd "${srcdir}/${_pkgbasename}-${pkgver}"
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
  				--libdir=/usr/lib32 CXX='g++ -m32'
  make
}

package() {
  cd "${srcdir}/${_pkgbasename}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  # Cleanup for a lib32 package
  rm -rf ${pkgdir}/usr/{include,lib32/$_pkgbasename*/}
  # Install license
  install -Dm644 COPYING ${pkgdir}/usr/share/licenses/$pkgname/COPYING 
}
