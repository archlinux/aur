# Maintainer: Nicolas Iooss (nicolas <dot> iooss <at> m4x <dot> org)
#
# This PKGBUILD is maintained on https://github.com/archlinuxhardened/selinux.
# If you want to help keep it up to date, please open a Pull Request there.

pkgname=mcstrans
pkgver=2.8
pkgrel=1
pkgdesc="SELinux MCS translation daemon"
arch=('i686' 'x86_64')
url='https://github.com/SELinuxProject/selinux/wiki'
license=('GPL2')
groups=('selinux')
depends=('libcap' 'libselinux>=2.8' 'pcre')
source=("https://raw.githubusercontent.com/wiki/SELinuxProject/selinux/files/releases/20180524/${pkgname}-${pkgver}.tar.gz")
sha256sums=('ec6ea65660550ed6bbd2a834725ba7526ac53599753d7b95072e4afd4afc14e4')

build() {
  cd "${pkgname}-${pkgver}"
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" SBINDIR=/usr/bin install

  # Remove mcstrans init script
  rm -rf "${pkgdir}/etc/rc.d"
  rmdir "${pkgdir}/etc"
}
