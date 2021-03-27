# Maintainer: robertfoster
# Maintainer: Toni Uhlig <matzeton@googlemail.com>

pkgname=ndpi-git
pkgver=3008.4bff5957
pkgrel=1
pkgdesc="Open and Extensible GPLv3 Deep Packet Inspection Library"
arch=('i686' 'x86_64')
url="http://www.ntop.org/products/ndpi/"
license=('GPL3')
requires=('libmaxminddb', 'libgcrypt')
provides=('ndpi')
conflicts=('ndpi')
source=("${pkgname%-git}::git+https://github.com/ntop/nDPI.git#branch=dev")
makedepends=('git')

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd ndpi
  CPPFLAGS="${CPPFLAGS} ${CFLAGS}"
  ./autogen.sh
  ./configure --prefix=/usr --with-pic --includedir=/usr/include --libdir=/usr/lib
  make
}

package() {
  cd ndpi
  make DESTDIR="${pkgdir}/" install
}

sha256sums=('SKIP')
