# Maintainer: Kenneth Endfinger <kaendfinger@gmail.com>
# Contributor: Christian Hesse <mail@eworm.de>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>

pkgname=python-blivet
pkgver=3.1.6
_tag="blivet-${pkgver}"
pkgrel=4
pkgdesc='A DBus service and python module for management of the system storage configuration'
arch=('any')
license=('LGPL2.1')
depends=('python'
         'python-six'
         'python-pyparted'
         'python-pyudev'
         'python-gobject'
         'libblockdev'
         'parted'
         'lsof'
         'multipath-tools'
         'util-linux'
         'systemd-libs'
)
checkdepends=('libselinux' 'python-mock' 'python-dbus')
makedepends=('python-setuptools' 'make')
url='https://fedoraproject.org/wiki/Blivet'
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/storaged-project/blivet/archive/blivet-${pkgver}.tar.gz")
sha512sums=('43a4233fcc696bb050ec5b9b3f2947efd2b6116409aa13025d09e99af2c9ef02df48e7e3087c2e4e2670c2ce2d0aa6587602c41e1af98f956bcf80f03464a622')

build() {
  cd "${srcdir}/blivet-${_tag}"
  make
}

package() {
  cd "${srcdir}/blivet-${_tag}"

  make DESTDIR="${pkgdir}" install
}

check() {
  cd "${srcdir}/blivet-${_tag}/"
  make test
}
