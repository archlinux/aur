# Maintainer: Kenneth Endfinger <kaendfinger@gmail.com>
# Contributor: Christian Hesse <mail@eworm.de>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>

pkgname=python-blivet
pkgver=3.2.2
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
sha512sums=('18ce6ae96aae669ae506af4704ace1246529abf76121ab5639839b51371cc93972fb3418caca8ad669f78ce632b24aa72bb092b4a90fdf3a8e8ca5a0567046a5')

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
