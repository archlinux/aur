# Maintainer: robertfoster
# Maintainer: Toni Uhlig <matzeton@googlemail.com>

pkgname=ndpi-git
pkgver=r5924.a58fc8468
pkgrel=1
pkgdesc="Open and Extensible GPLv3 Deep Packet Inspection Library"
arch=('x86_64')
url="http://www.ntop.org/products/ndpi/"
license=('GPL-3.0-or-later')
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
