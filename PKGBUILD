# Maintainer: Nicolas Iooss (nicolas <dot> iooss <at> m4x <dot> org)
# Contributor: Timothée Ravier <tim@siosm.fr>
# Contributor: Nicky726 (Nicky726 <at> gmail <dot> com)
# Contributor: Sergej Pupykin (pupykin <dot> s+arch <at> gmail <dot> com)
#
# This PKGBUILD is maintained on https://github.com/archlinuxhardened/selinux.
# If you want to help keep it up to date, please open a Pull Request there.

pkgname=checkpolicy
pkgver=3.11
pkgrel=1
pkgdesc="SELinux policy compiler"
arch=('i686' 'x86_64' 'aarch64')
url='https://github.com/SELinuxProject/selinux'
license=('GPL2')
groups=('selinux')
makedepends=('libsepol>=3.8')
conflicts=("selinux-usr-${pkgname}")
provides=("selinux-usr-${pkgname}=${pkgver}-${pkgrel}")
validpgpkeys=(
  '63191CE94183098689CAB8DB7EF137EC935B0EAF'  # Jason Zaman <perfinion@gentoo.org>
  '68D21823342A13683AEB3E4EFB4C685B5DC1C13E'  # Petr Lautrbach <lautrbach@redhat.com>
)
source=("https://github.com/SELinuxProject/selinux/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz"{,.asc})
sha256sums=('9b81bfceef7fa9d02f9872e56a786f343dc58ef4b5713dce0d5c416e5b84cefa'
            'SKIP')

build() {
  cd "${pkgname}-${pkgver}"
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -m 0755 test/dismod "${pkgdir}"/usr/bin/sedismod
  install -m 0755 test/dispol "${pkgdir}"/usr/bin/sedispol
}
