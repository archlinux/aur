# Maintainer: iamawacko <iamawacko@protonmail.com>
# Contributor: Brian Bidulock <bidulock@openss7.org>

pkgname=crmsh
pkgver=5.0.0
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
sha512sums=('464629a5316df849511b1b660d2bbff17f5a76418886ad6dc3578833c4bc2655cc6adc72c6e734ed65f0f38e5c4e86565fd029358cdc48710ffe310e6e69ea96')

prepare() {
  cd ${pkgname}-${pkgver}
  ./autogen.sh
}

build() {
  cd ${pkgname}-${pkgver}
  ./configure PYTHON=python \
              --prefix=${pkgdir}/usr \
              --libdir=${pkgdir}/usr/lib \
              --sbindir=${pkgdir}/usr/bin \
              --sysconfdir=${pkgdir}/etc \
              --localstatedir=${pkgdir}/var
  make V=0
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}

# vim: set sw=2 et:

