# Maintainer: iamawacko <iamawacko@protonmail.com>
# Contributor: Brian Bidulock <bidulock@openss7.org>

pkgname=crmsh
pkgver=4.6.2
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
sha512sums=('02e7b145f3860490690aa95fdab535afa5f0c1e12d58743b32ea47df53e1dc3b51bfbf14f8e6f4a6ba5608c1f3240656d2bacda6b43bbc198e98c760081b6324')

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

