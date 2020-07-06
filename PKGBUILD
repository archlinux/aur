# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=crmsh
pkgver=4.2.0
pkgrel=1
pkgdesc="Command-line interface for high-availability cluster management on GNU/Linux systems"
arch=('any')
url="https://github.com/ClusterLabs/${pkgname}/"
license=('GPL2')
makedepends=('asciidoc' 'python-setuptools')
depends=('pacemaker'
         'csync2'
         'python'
         'python-parallax'
         'python-pycurl'
         'python-lxml'
         'python-dateutil'
         'python-yaml'
         'python-urllib3'
         'python-simplejson'
         'gawk')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ClusterLabs/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('3522a28c86069216222eb2efbb258014d74ce838e49885cd527a69d890415ea0899632b4cec095d2fde802b26cd7e673b0e9ea20e8d023fc7c4df140be600ef9')

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

sha512sums=('f293131b709d585ea13d3fc4d8e7564b3f0f0f930a9896cbc89d31137a5c0d7df68f1e31b73e3b0ab5786178b68d6bddcf81e165a85fbce152787168f4fd0c7b')
