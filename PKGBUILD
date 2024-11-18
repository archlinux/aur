# Maintainer: iamawacko <iamawacko@protonmail.com>
# Contributor: Brian Bidulock <bidulock@openss7.org>

pkgname=crmsh
pkgver=4.6.1
pkgrel=1
pkgdesc="Command-line interface for high-availability cluster management on GNU/Linux systems"
arch=('any')
url="https://github.com/ClusterLabs/${pkgname}/"
license=('GPL2')
makedepends=('asciidoc' 'python-setuptools')
depends=('python'
         'python-lxml'
         'python-dateutil'
         'python-yaml')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ClusterLabs/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('ff4860bc4f9dffb16279897459a9385bb4bee886ebf881e693d2173375a09265702adcb700cff6e8a39df406fac1ce7afb5f7213210245ae515099c1f90500b3')

prepare() {
  cd ${pkgname}-${pkgver}
  ./autogen.sh
}

build() {
  cd ${pkgname}-${pkgver}
  ./configure PYTHON=python \
              --prefix=/usr \
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

