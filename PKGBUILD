# Maintainer: Florian Pritz <bluewind@xinu.at>

_pkgbasename=libidn
pkgname=lib32-$_pkgbasename
pkgver=1.38
pkgrel=1
pkgdesc="Implementation of the Stringprep, Punycode and IDNA specifications (32 bit)"
url="https://www.gnu.org/software/libidn/"
arch=('x86_64')
license=('GPL3' 'LGPL')
depends=('lib32-glibc' "$_pkgbasename>=$pkgver")
source=("https://ftp.gnu.org/gnu/${_pkgbasename}/${_pkgbasename}-${pkgver}.tar.gz"{,.sig})
sha512sums=('5e59b2263fde44d1463b47b516347b17a4e3e3696ebba66ab5fe464d567e2ec81f769fa7cf72ed51cfb501e32221813bb375373713a47e2f599fc6122850e419'
            'SKIP')
validpgpkeys=('9AA9BDB11BB1B99A21285A330664A76954265E8C'  # Simon Josefsson <simon@josefsson.org>
              '1CB27DBC98614B2D5841646D08302DB6A2670428') # Tim Rühsen <tim.ruehsen@gmx.de>

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
