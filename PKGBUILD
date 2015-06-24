# Contributor: Johannes Dewender  arch at JonnyJD dot net
# Contributor: josephgbr <rafael.f.f1@gmail.com>

_pkgbase=lame
pkgname=lib32-${_pkgbase}
pkgver=3.99.5
pkgrel=2
pkgdesc="A high quality MPEG Audio Layer III (MP3) encoder (32 bit)"
arch=('x86_64')
url="http://lame.sourceforge.net/"
depends=('lib32-glibc' "${_pkgbase}")
makedepends=('lib32-ncurses' 'gcc-multilib' 'nasm')
license=('LGPL')
source=(http://downloads.sourceforge.net/sourceforge/${_pkgbase}/${_pkgbase}-${pkgver}.tar.gz)
md5sums=('84835b313d4a8b68f5349816d33e07ce')

build() {
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  
  cd "${srcdir}/${_pkgbase}-${pkgver}"
  ./configure --prefix=/usr --enable-nasm --enable-shared --libdir=/usr/lib32
  make
}

package() {
  cd "${srcdir}/${_pkgbase}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}/usr"/{bin,include,share}
}
