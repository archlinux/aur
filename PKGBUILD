# Contributor: Michael Fellinger <m.fellinger@gmail.com>
pkgname=libtomcrypt
_pkgname=crypt
pkgver=1.17
pkgrel=8
pkgdesc="Comprehensive, modular, and portable cryptographic toolkit/library."
url="http://libtom.org/?page=features&whatfile=crypt"
license="public domain"
arch=('i686' 'x86_64')
depends=('gmp')
makedepends=('gmp' 'libtommath')
conflicts=()
replaces=()
backup=()
options=('!emptydirs')
source=("http://libtom.org/files/${_pkgname}-${pkgver}.tar.bz2")
md5sums=('cea7e5347979909f458fe7ebb5a44f85')

build() {
  cd ${srcdir}/$pkgname-$pkgver
  make NODOCS=1 DESTDIR="$pkgdir" install
  make NODOCS=1 DESTDIR="$pkgdir" clean
  CFLAGS="-DLTM_DESC -DGMP_DESC" \
  EXTRALIBS="-ltommath -lgmp" \
  make -f makefile.shared NODOCS=1 DESTDIR="$pkgdir" install
}
