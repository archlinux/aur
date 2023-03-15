# Maintainer: Nicolas Iooss (nicolas <dot> iooss <at> m4x <dot> org)
# Contributor: Timothée Ravier <tim@siosm.fr>
# Contributor: Nicky726 (Nicky726 <at> gmail <dot> com)
# Contributor: Sergej Pupykin (pupykin <dot> s+arch <at> gmail <dot> com)
# Contributor: angelux/xangelux (xangelux <at> gmail <dot> com)
#
# This PKGBUILD is maintained on https://github.com/archlinuxhardened/selinux.
# If you want to help keep it up to date, please open a Pull Request there.

pkgname=policycoreutils
pkgver=3.5
pkgrel=1
pkgdesc="SELinux policy core utilities"
arch=('i686' 'x86_64' 'aarch64')
url='https://github.com/SELinuxProject/selinux'
license=('GPL2')
groups=('selinux')
depends=('libsemanage>=3.5' 'pam')
optdepends=('mcstrans: SELinux MCS translation daemon'
            'restorecond: SELinux daemon that fixes SELinux file contexts'
            'selinux-dbus-config: D-Bus configuration for SELinux'
            'selinux-gui: GUI tools for SELinux'
            'selinux-python: Python tools and libraries for SELinux'
            'selinux-sandbox: sandboxing tool for SELinux'
            'semodule-utils: SELinux module tools')
conflicts=("selinux-usr-${pkgname}")
provides=("selinux-usr-${pkgname}=${pkgver}-${pkgrel}")
validpgpkeys=(
  '63191CE94183098689CAB8DB7EF137EC935B0EAF'  # Jason Zaman <perfinion@gentoo.org>
  'E853C1848B0185CF42864DF363A8AD4B982C4373'  # Petr Lautrbach <plautrba@redhat.com>
)
source=("https://github.com/SELinuxProject/selinux/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz"{,.asc})
sha256sums=('78453e1529fbbf800e88860094d555e781ce1fba11a7ef77b5aabb43e1173276'
            'SKIP')

build() {
  cd "${pkgname}-${pkgver}"
  make LSPP_PRIV=y all
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" LIBEXECDIR=/usr/lib SBINDIR=/usr/bin install
}
