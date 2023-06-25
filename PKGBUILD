# Maintainer: Pellegrino Prevete (tallero) <pellegrinoprevete at gmail dot com>
# Contributor: Baptiste Jonglez <baptiste--aur at jonglez dot org>

_py="python2"
_pkg="lvm"
pkgname="${_py}-${_pkg}"
pkgver=2.02.188
pkgrel=1
arch=(
  i686
  x86_64)
url="http://sourceware.org/${_pkg}"
license=('LGPL2.1')
pkgdesc="Python 2 bindings for LVM"
depends=(
  "${_py}"
  "${_pkg}2")
_repo_url="https://ftp.gwdg.de/pub/linux/sources.redhat.com"
source=("${_repo_url}/${_pkg}2/LVM2.${pkgver}.tgz"{,.asc})
sha256sums=('7101e8b0816ad77e4390fed9749a090214ba520061cd083437871e19e50cc9bd'
            'SKIP')
validpgpkeys=('88437EF5C077BD113D3B7224228191C1567E2C17'  # Alasdair G Kergon <agk@redhat.com>
              'D501A478440AE2FD130A1BE8B9112431E509039F') # Marian Csontos <mcsontos@redhat.com>

build() {
  local _configure_opts=(
          '--prefix=/usr'
          '--sysconfdir=/etc'
          '--localstatedir=/var'
          '--sbindir=/usr/bin'
          '--with-udev-prefix=/usr'
          '--with-systemdsystemunitdir=/usr/lib/systemd/system'
          '--with-default-pid-dir=/run'
          '--with-default-dm-run-dir=/run'
          '--with-default-run-dir=/run/lvm'
          '--with-default-locking-dir=/run/lock/lvm'
          '--enable-applib'
          '--enable-python2_bindings')

  cd LVM2.${pkgver}

  ./configure "${_configure_opts[@]}"
  make python
}

package() {
  cd LVM2.${pkgver}

  make -C python DESTDIR="${pkgdir}" install
}
