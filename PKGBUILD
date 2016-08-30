
# Maintainer: Gicu Gorodenco <cyclopsihus 'at' gmail 'dot' com>
# Contributor: josephgbr <rafael.f.f1 'at' gmail 'dot' com> 
_pkgbasename=cairomm
pkgname=lib32-$_pkgbasename
pkgver=1.12.0
pkgrel=1
pkgdesc="C++ bindings to Cairo vector graphics library (32 bit)"
arch=('x86_64')
url="http://www.cairographics.org"
license=('LGPL' 'MPL')
depends=('lib32-cairo' 'lib32-libsigc++' "$_pkgbasename")
makedepends=('pkgconfig' 'gcc-multilib')
options=('!libtool' '!emptydirs')
source=(http://www.cairographics.org/releases/${_pkgbasename}-${pkgver}.tar.gz)
sha256sums=('50435aec6fdd976934b791e808993160113ad19ca53a5634a9b64ccbe55874cc')

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
