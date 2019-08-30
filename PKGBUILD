# Maintainer: Baptiste Jonglez <baptiste--aur at jonglez dot org>
# Based on the lvm2 package in [core]
pkgname="python-lvm"
pkgver=2.02.186
pkgrel=1
arch=('i686' 'x86_64')
url="http://sourceware.org/lvm2/"
license=('LGPL2.1')
pkgdesc="Python 3 bindings for LVM"
depends=('python' 'lvm2')
source=("https://ftp.gwdg.de/pub/linux/sources.redhat.com/lvm2/LVM2.${pkgver}.tgz"{,.asc})
sha256sums=('d8421eee702982dc0d8b0c9e40cc1443ee487eff1460a00244a9f4bf439a27be'
            'SKIP')
validpgpkeys=('88437EF5C077BD113D3B7224228191C1567E2C17'  # Alasdair G Kergon <agk@redhat.com>
              'D501A478440AE2FD130A1BE8B9112431E509039F') # Marian Csontos <mcsontos@redhat.com>

build() {
  local _CONFIGUREOPTS="--prefix=/usr --sysconfdir=/etc --localstatedir=/var --sbindir=/usr/bin \
      --with-udev-prefix=/usr --with-systemdsystemunitdir=/usr/lib/systemd/system \
      --with-default-pid-dir=/run --with-default-dm-run-dir=/run --with-default-run-dir=/run/lvm \
      --with-default-locking-dir=/run/lock/lvm \
      --enable-applib --enable-python3_bindings"

  cd LVM2.${pkgver}

  ./configure ${_CONFIGUREOPTS}
  make python
}

package() {
  cd LVM2.${pkgver}

  make -C python DESTDIR="${pkgdir}" install
}
