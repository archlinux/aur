# Maintainer: iamawacko <iamawacko@protonmail.com>
# Contributor: Brian Bidulock <bidulock@openss7.org>

pkgname=crmsh
pkgver=4.6.0
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
sha512sums=('ce2751c7f78f3099104f03cfa62ccf602db27150d8e885f80bfad03730dfe20cecb4210493c3a27efbe4fe16b74457de870b9518dcc66bca82ce6678c0075fe3')

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

