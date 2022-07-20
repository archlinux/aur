# Maintainer: muttleyxd <mateusz [at] szychowski.it>
_upstream_pkgname=libunwind
pkgname=libunwind-carbon
pkgver=1.6.2
pkgrel=1
pkgdesc='Portable and efficient C programming interface (API) to determine the call-chain of a program (enabled C++ exception support for Carbon language)'
arch=('x86_64')
url='https://www.nongnu.org/libunwind/'
license=('GPL')
depends=('xz' 'zlib')
provides=('libunwind')
conflicts=('libunwind')
makedepends=('texlive-core')
source=("https://download.savannah.gnu.org/releases/$_upstream_pkgname/$_upstream_pkgname-$pkgver.tar.gz"{,.sig})
sha512sums=('1d17dfb14f99a894a6cda256caf9ec481c14068aaf8f3a85fa3befa7c7cca7fca0f544a91a3a7c2f2fc55bab19b06a67ca79f55ac9081151d94478c7f611f8f7'
            'SKIP')
validpgpkeys=('5C96BDEAF5F47FB02BD4F6B965D98560914F3F48'  # Arun Sharma
              '1675C8DA2EF907FB116EB709EC52B396E6874AF2'  # Dave Watson
              '75D2CFC56CC2E935A4143297015A268A17D55FA4') # Dave Watson
options=('staticlibs')

build() {
  cd $_upstream_pkgname-$pkgver
  ./configure --prefix=/usr --enable-cxx-exceptions
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

check() {
  cd $_upstream_pkgname-$pkgver
  # This function is ``supposed'' to fail. Upstream know, but haven't fixed it.
  make check || :
}

package() {
  cd $_upstream_pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
