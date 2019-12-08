# Maintainer: Nicolas Iooss (nicolas <dot> iooss <at> m4x <dot> org)
#
# This PKGBUILD is maintained on https://github.com/archlinuxhardened/selinux.
# If you want to help keep it up to date, please open a Pull Request there.

pkgname=mcstrans
pkgver=3.0
pkgrel=1
pkgdesc="SELinux MCS translation daemon"
arch=('i686' 'x86_64')
url='https://github.com/SELinuxProject/selinux/wiki'
license=('GPL2')
groups=('selinux')
depends=('libcap' 'libselinux>=2.8' 'pcre')
source=("https://github.com/SELinuxProject/selinux/releases/download/20191204/${pkgname}-${pkgver}.tar.gz")
sha256sums=('0992b8e7c4de1ba5f98a82547b02418370be5a5f588fc6d5f1cd2c7824bda87e')

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
