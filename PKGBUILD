# Maintainer: Nicolas Iooss (nicolas <dot> iooss <at> m4x <dot> org)
#
# This PKGBUILD is maintained on https://github.com/archlinuxhardened/selinux.
# If you want to help keep it up to date, please open a Pull Request there.

pkgname=restorecond
pkgver=3.1
pkgrel=1
pkgdesc="SELinux restorecon daemon"
arch=('i686' 'x86_64')
url='https://github.com/SELinuxProject/selinux/wiki'
license=('GPL2')
groups=('selinux')
makedepends=('pkgconf')
depends=('dbus-glib' 'libselinux>=2.7')
conflicts=('policycoreutils<2.7')
source=("https://github.com/SELinuxProject/selinux/releases/download/20200710/${pkgname}-${pkgver}.tar.gz")
sha256sums=('82ca45099685a45d718f11f8859963c1ba83d98e510312cbf0b7dc5664c60ad0')

build() {
  cd "${pkgname}-${pkgver}"
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" SBINDIR=/usr/bin install

  # Remove restorecond init script
  rm -rf "${pkgdir}/etc/rc.d"
}
