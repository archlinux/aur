# Maintainer: Kenneth Endfinger <kaendfinger@gmail.com>
# Contributor: Christian Hesse <mail@eworm.de>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>

pkgname=python-blivet
pkgver=3.2.1
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
sha512sums=('bb9b9bf01cc0acfb58a8e9e1033ea16361011ece4aa644e45d90379d8c1f730dfbc09b6c40e91c70dde31d2f95420a9a0fea90827fea3ae0b0bfa2846db8bdd9')

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
