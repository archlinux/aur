# Maintainer: robertfoster
# Co-Maintainer: toni

pkgname=ndpi-git
pkgver=r3017.0f8a9948
pkgrel=1
pkgdesc="Open and Extensible GPLv3 Deep Packet Inspection Library"
arch=('i686' 'x86_64')
url="http://www.ntop.org/products/ndpi/"
license=('GPL3')
provides=('ndpi')
conflicts=('ndpi')
source=("${pkgname%-git}::git+https://github.com/ntop/nDPI.git#branch=dev")
makedepends=('git')

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${pkgname%-git}"
  CPPFLAGS="${CPPFLAGS} ${CFLAGS}"
  ./autogen.sh
  ./configure --prefix=/usr \
    --with-pic \
    --includedir=/usr/include \
    --libdir=/usr/lib
  make
}

package() {
  cd "${srcdir}/${pkgname%-git}"
  make DESTDIR="${pkgdir}" install
  ln -sf /usr/include/ndpi \
    "${pkgdir}/usr/include/libndpi"
}

sha256sums=('SKIP')
