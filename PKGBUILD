# Maintainer: Florian Pritz <bluewind@xinu.at>

_pkgbasename=libidn
pkgname=lib32-$_pkgbasename
pkgver=1.43
pkgrel=1
pkgdesc="Implementation of the Stringprep, Punycode and IDNA specifications (32 bit)"
url="https://www.gnu.org/software/libidn/"
arch=('x86_64')
license=('GPL3' 'LGPL')
depends=('lib32-glibc' "$_pkgbasename>=$pkgver")
source=("https://ftp.gnu.org/gnu/${_pkgbasename}/${_pkgbasename}-${pkgver}.tar.gz"{,.sig})
validpgpkeys=('9AA9BDB11BB1B99A21285A330664A76954265E8C'  # Simon Josefsson <simon@josefsson.org>
              'B1D2BD1375BECB784CF4F8C4D73CF638C53C06BE'  # Simon Josefsson <simon@josefsson.org>
              '1CB27DBC98614B2D5841646D08302DB6A2670428') # Tim Rühsen <tim.ruehsen@gmx.de>
sha256sums=('bdc662c12d041b2539d0e638f3a6e741130cdb33a644ef3496963a443482d164'
            'SKIP')

build() {
  cd ${_pkgbasename}-${pkgver}

  ./configure \
    CC='gcc -m32' \
    --prefix=/usr \
    --libdir=/usr/lib32
  make
}

package() {
  cd ${_pkgbasename}-${pkgver}

  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/{bin,include,share}
}
