# Maintainer: Cedric Girard <girard.cedric@gmail.com>
# Contributor: blue_lizard lizard@blue.dyn-o-saur.com

pkgname=mmv
pkgver=2.7
pkgrel=1
pkgdesc="multiple move files"
source=(
  https://github.com/rrthomas/mmv/releases/download/v${pkgver}/mmv-${pkgver}.tar.gz
)
sha256sums=('11346686634000e22aa909e08d9d450237c4b61062779935cbd81df78efad72d')

url="https://github.com/rrthomas/mmv"
license=(GPL-2.0-or-later)
install=$pkgname.install
arch=('i686' 'x86_64')

prepare() {
  cd "${srcdir}/$pkgname-$pkgver"
  ./configure --prefix /usr
}

build() {
  cd "${srcdir}/$pkgname-$pkgver"
  make
}

package(){
  cd "${srcdir}/$pkgname-$pkgver"
  mkdir -p "${pkgdir}/usr/bin"
  mkdir -p "${pkgdir}/usr/share/man/man1"
  make DESTDIR="${pkgdir}" install
  chmod 644 "${pkgdir}/usr/share/man/man1/mmv.1"
  cd "${pkgdir}/usr/share/man/man1/"
  ln -s mmv.1 mcp.1
  ln -s mmv.1 mad.1
  ln -s mmv.1 mln.1
}
