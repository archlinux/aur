# Maintainer: Nicolas Iooss (nicolas <dot> iooss <at> m4x <dot> org)
#
# This PKGBUILD is maintained on https://github.com/archlinuxhardened/selinux.
# If you want to help keep it up to date, please open a Pull Request there.

pkgname=mcstrans
pkgver=3.5
pkgrel=1
pkgdesc="SELinux MCS translation daemon"
arch=('i686' 'x86_64' 'aarch64')
url='https://github.com/SELinuxProject/selinux/wiki'
license=('GPL2')
groups=('selinux')
depends=('libcap' 'libselinux>=3.5' 'pcre')
validpgpkeys=(
  '63191CE94183098689CAB8DB7EF137EC935B0EAF'  # Jason Zaman <perfinion@gentoo.org>
  'E853C1848B0185CF42864DF363A8AD4B982C4373'  # Petr Lautrbach <plautrba@redhat.com>
)
source=("https://github.com/SELinuxProject/selinux/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz"{,.asc})
sha256sums=('0e94ee10a883a47526d8658a8ec7f8a37e00a2dfeb72435c333aba4d95110fc4'
            'SKIP')

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
