# Maintainer: E-Hern Lee <ehern.lee@gmail.com>
# Contributor: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Panagiotis Papadopoulos pano_90 AT gmx DOT net 

pkgname=lib32-libbs2b
_pkgname=libbs2b
pkgver=3.1.0
pkgrel=4
pkgdesc="Bauer stereophonic-to-binaural DSP effect library"
arch=('i686' 'x86_64')
url='http://bs2b.sourceforge.net'
license=('GPL')
depends=('lib32-libsndfile' 'libbs2b')
source=(
  https://cfhcable.dl.sourceforge.net/project/bs2b/$_pkgname/$pkgver/$_pkgname-$pkgver.tar.gz
  printf.patch
)
sha512sums=(
  'SKIP'
  'SKIP'
)

prepare() {
  patch --forward --strip=1 --input="${srcdir}/printf.patch"
}

build() {
  cd "${_pkgname}-${pkgver}"
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  ./configure --prefix=/usr --libdir=/usr/lib32
  make
}

package() {
  cd "${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  rm -rf $pkgdir/usr/{include,bin}
}
