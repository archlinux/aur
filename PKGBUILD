# Maintainer: Andrew Munkres <amunkres@nyx.net>

pkgname=xroachng
pkgver=1.0.3
pkgrel=1
pkgdesc="Cockroaches hide under your windows (compatible with modern desktop environments)"
arch=('i686' 'x86_64')
url="https://www.ratrabbit.nl/ratrabbit/software/xroach_ng/"
license=('GPL3' 'custom:xroach')
depends=('gtk3')
makedepends=('pkgconfig' 'make' 'libxt')
source=("https://www.ratrabbit.nl/downloads/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('54f8c26f3ad0d3a76367a8d40556ef58fc9844009973de42d5d305b460e2f755')

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -D -m644 src/main.c "${pkgdir}"/usr/share/licenses/xroachng/xroach-LICENSE
}
