# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=crmsh
pkgver=3.0.4
pkgrel=1
pkgdesc="Command-line interface for high-availability cluster management on GNU/Linux systems"
arch=('any')
url="https://github.com/ClusterLabs/${pkgname}/"
license=('GPL2')
makedepends=('asciidoc' 'python2-setuptools')
depends=('python' 'python2' 'python2-parallax' 'python2-lxml' 'python2-yaml' 'python2-dateutil' 'gawk' 'csync2')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ClusterLabs/$pkgname/archive/$pkgver.tar.gz")
md5sums=('026ba8a8bbeb17dc965e5bf806fb1109')

prepare() {
  cd ${pkgname}-${pkgver}
  ./autogen.sh
}

build() {
  cd ${pkgname}-${pkgver}
  ./configure PYTHON=python2 \
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

