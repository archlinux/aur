# Maintainer: Nicolas Iooss (nicolas <dot> iooss <at> m4x <dot> org)
#
# This PKGBUILD is maintained on https://github.com/archlinuxhardened/selinux.
# If you want to help keep it up to date, please open a Pull Request there.

pkgname=mcstrans
pkgver=3.2
pkgrel=1
pkgdesc="SELinux MCS translation daemon"
arch=('i686' 'x86_64' 'aarch64')
url='https://github.com/SELinuxProject/selinux/wiki'
license=('GPL2')
groups=('selinux')
depends=('libcap' 'libselinux>=3.2' 'pcre')
source=("https://github.com/SELinuxProject/selinux/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('fafaf7614b7114b95c582643f8b2a6ae1605093fbaf3b571d9b01fc81fb70929')

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
