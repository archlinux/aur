# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=crmsh-git
_pkgname=crmsh
pkgver=4.2.0.r102.geaa14889
pkgrel=1
pkgdesc="Command-line interface for high-availability cluster management on GNU/Linux systems"
arch=('any')
url="https://github.com/ClusterLabs/${_pkgname}/"
license=('GPL2')
makedepends=('git' 'asciidoc' 'python-setuptools')
depends=('pacemaker'
         'csync2-git'
         'python'
         'python-parallax'
         'python-pycurl'
         'python-lxml'
         'python-dateutil'
         'python-yaml'
         'python-urllib3'
         'python-simplejson'
         'gawk')
provides=(${_pkgname})
conflicts=(${_pkgname})
source=("$pkgname::git+https://github.com/ClusterLabs/${_pkgname}.git#branch=master")
md5sums=('SKIP')

pkgver() {
  cd ${pkgname}
  git describe --long --tags | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd ${pkgname}
  ./autogen.sh
}

build() {
  cd ${pkgname}
  ./configure PYTHON=python \
              --prefix=/usr \
              --libdir=/usr/lib \
              --sbindir=/usr/bin \
              --sysconfdir=/etc \
              --localstatedir=/var
  make V=0
}

package() {
  cd ${pkgname}
  make DESTDIR="${pkgdir}" install
}

# vim: set sw=2 et:

