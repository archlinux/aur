
# Maintainer: Gicu Gorodenco <cyclopsihus 'at' gmail 'dot' com>
# Contributor: josephgbr <rafael.f.f1 'at' gmail 'dot' com> 
_pkgbasename=cairomm
pkgname=lib32-$_pkgbasename
pkgver=1.11.2
pkgrel=1
pkgdesc="C++ bindings to Cairo vector graphics library (32 bit)"
arch=('x86_64')
url="http://www.cairographics.org"
license=('LGPL' 'MPL')
depends=('lib32-cairo' 'lib32-libsigc++' "$_pkgbasename")
makedepends=('pkgconfig' 'gcc-multilib')
options=('!libtool' '!emptydirs')
source=(http://www.cairographics.org/releases/${_pkgbasename}-${pkgver}.tar.gz)
sha256sums=('ccf677098c1e08e189add0bd146f78498109f202575491a82f1815b6bc28008d')

build() {
  cd "${srcdir}/${_pkgbasename}-${pkgver}"
  ./configure --prefix=/usr --libdir=/usr/lib32 CC='gcc -m32' CXX='g++ -m32'
  make
}

package() {
  cd "${srcdir}/${_pkgbasename}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  # Cleanup for a lib32 package
  rm -rf ${pkgdir}/usr/{include,lib32/cairomm*,share}
}

