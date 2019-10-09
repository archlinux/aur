# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=crmsh
pkgver=4.0.0
pkgrel=1
pkgdesc="Command-line interface for high-availability cluster management on GNU/Linux systems"
arch=('any')
url="https://github.com/ClusterLabs/${pkgname}/"
license=('GPL2')
makedepends=('asciidoc' 'python-setuptools')
depends=('python' 'python-parallax' 'python-lxml' 'python-yaml' 'python-dateutil' 'gawk' 'csync2')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ClusterLabs/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('d64f802d031201cb85434180ec4fb622a4dd8fc9196d367df815c202b43a9d180fb4a074b80bfbf99ceeb2a260f57dd35f262092e3abd00febbae844d3a68425')

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

