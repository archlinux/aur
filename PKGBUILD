# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=crmsh
pkgver=2.2.1
pkgrel=1
pkgdesc="Command-line interface for high-availability cluster management on GNU/Linux systems"
arch=('any')
url="https://github.com/ClusterLabs/${pkgname}/"
license=('GPL2')
makedepends=('asciidoc')
depends=('python' 'gawk')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ClusterLabs/$pkgname/archive/$pkgver.tar.gz")
md5sums=('81f8e4595fa53f9f220a7500e3759e6c')

prepare() {
  cd ${pkgname}-${pkgver}
  ./autogen.sh
}

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr \
              --libdir=/usr/lib \
              --sbindir=/usr/bin \
              --sysconfdir=/etc \
              --localstatedir=/var
  make V=0
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}

# vim: set sw=2 et:

