# Maintainer: Baptiste Jonglez <baptiste--aur at jonglez dot org>
# Based on the lvm2 package in [core]
pkgname="python-lvm"
pkgver=2.02.182
pkgrel=1
arch=('i686' 'x86_64')
url="http://sourceware.org/lvm2/"
license=('LGPL2.1')
pkgdesc="Python 3 bindings for LVM"
depends=('python' 'lvm2')
source=("https://ftp.gwdg.de/pub/linux/sources.redhat.com/lvm2/LVM2.${pkgver}.tgz"{,.asc})
sha256sums=('4964b93778dd37ffb7ecdc1b16820710a851fcbb2ba822e42dd4030fb1cc0642'
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
