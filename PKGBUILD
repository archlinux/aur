# Maintainer: Baptiste Jonglez <baptiste--aur at jonglez dot org>
# Based on the lvm2 package in [core]
pkgname="python2-lvm"
pkgver=2.02.171
pkgrel=1
arch=('i686' 'x86_64')
url="http://sourceware.org/lvm2/"
license=('LGPL2.1')
pkgdesc="Python 2 bindings for LVM"
depends=('python2' 'lvm2')
source=(https://mirrors.kernel.org/sourceware/lvm2/releases/LVM2.${pkgver}.tgz{,.asc})
sha256sums=('b815a711a2fabaa5c3dc1a4a284df0268bf0f325f0fc0f5c9530c9bbb54b9964'
            'SKIP')
validpgpkeys=('88437EF5C077BD113D3B7224228191C1567E2C17')

build() {
  CONFIGUREOPTS="--prefix=/usr --sysconfdir=/etc --localstatedir=/var --sbindir=/usr/bin \
      --with-udev-prefix=/usr --with-systemdsystemunitdir=/usr/lib/systemd/system \
      --with-default-pid-dir=/run --with-default-dm-run-dir=/run --with-default-run-dir=/run/lvm \
      --with-default-locking-dir=/run/lock/lvm \
      --enable-applib --enable-python2_bindings"

  cd LVM2.${pkgver}

  ./configure $CONFIGUREOPTS
  make python
}

package() {
  cd LVM2.${pkgver}

  make -C python DESTDIR="${pkgdir}" install
}
