# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Levente Polyak <anthraxx@archlinux.org>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Daurnimator <quae@daurnimator.com>

pkgname=lib32-libidn2-git
pkgver=2.3.0
pkgrel=1
pkgdesc='Free software implementation of IDNA2008, Punycode and TR46'
url='https://www.gnu.org/software/libidn/#libidn2'
arch=('x86_64')
license=('GPL2' 'LGPL3')
depends=('libidn2' 'lib32-glibc' 'lib32-libunistring')
makedepends=('ruby-ronn')
provides=(lib32-libidn2)
conflicts=(lib32-libidn2)
source=("git+https://gitlab.com/libidn/libidn2.git")
sha256sums=('SKIP')
#validpgpkeys=('1CB27DBC98614B2D5841646D08302DB6A2670428') # Tim Rühsen <tim.ruehsen@gmx.de>

pkgver() {
  cd libidn2
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd libidn2
}

build() {
  cd libidn2
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  ./bootstrap
  ./configure \
    --prefix=/usr \
    --libdir=/usr/lib32
  make
}

#check() {
#  cd libidn2
#  make check
#}

package() {
  cd libidn2
  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/{bin,include,share}
}

# vim: ts=2 sw=2 et:
