# Maintainer: Florian Pritz <bluewind@xinu.at>
# Contributor: Joakim Hernberg <jhernberg at alchemy dot lu>
_pkgbasename=gettext
pkgname=lib32-$_pkgbasename
pkgver=0.18.1.1
pkgrel=1
pkgdesc="GNU internationalization library (32-bit)"
arch=('x86_64')
url="http://www.gnu.org/software/gettext/"
license=('GPL')
depends=('gcc-multilib' 'lib32-acl' $_pkgbasename)
optdepends=('cvs: for autopoint tool')
options=(!libtool !docs)
source=(ftp://ftp.gnu.org/pub/gnu/gettext/${_pkgbasename}-${pkgver}.tar.gz)
md5sums=('3dd55b952826d2b32f51308f2f91aa89')

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd "${srcdir}/${_pkgbasename}-${pkgver}"
  sed -i -e 's/libexpat.so.0/libexpat.so.1/' gettext-tools/src/x-glade.c
  ./configure --prefix=/usr --enable-csharp --libdir=/usr/lib32
  make
}

#check() {
#  cd "${srcdir}/${pkgname}-${pkgver}"
#  make check
#}

package() {
  cd "${srcdir}/${_pkgbasename}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/{bin,include,share}
}
