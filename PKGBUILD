# Maintainer: Kenneth Endfinger <kaendfinger@gmail.com>
# Contributor: Christian Hesse <mail@eworm.de>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>

pkgname=python-blivet
pkgver=3.2.0
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
sha512sums=('e3260bc20194061aa11e7cece469d196fd6ff8cc114814e306345e17e9e76d4b88b86f7024fa6f0e26d6b634506114f86520a5c53d4d778d074cac219c50583b')

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
