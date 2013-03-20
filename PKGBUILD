# Maintainer: Florian Pritz <bluewind@xinu.at>
# Contributor: Joakim Hernberg <jhernberg at alchemy dot lu>
_pkgbasename=gettext
pkgname=lib32-$_pkgbasename
pkgver=0.18.2.1
pkgrel=1
pkgdesc="GNU internationalization library (32-bit)"
arch=('x86_64')
url="http://www.gnu.org/software/gettext/"
license=('GPL')
depends=('lib32-acl' $_pkgbasename)
makedepends=(gcc-multilib)
optdepends=('cvs: for autopoint tool')
options=(!libtool !docs)
source=(ftp://ftp.gnu.org/pub/gnu/gettext/${_pkgbasename}-${pkgver}.tar.gz{,.sig})
md5sums=('034c8103b14654ebd300fadac44d6f14'
         'e4658c307333395a12f8d0b4d95fbb0f')

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd "${srcdir}/${_pkgbasename}-${pkgver}"
  ./configure --prefix=/usr --libdir=/usr/lib32
  make
}

check() {
 cd "${srcdir}/${_pkgbasename}-${pkgver}"
 make check
}

package() {
  cd "${srcdir}/${_pkgbasename}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/{bin,include,share}
}
