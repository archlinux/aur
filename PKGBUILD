# Maintainer: Nicolas Iooss (nicolas <dot> iooss <at> m4x <dot> org)
# Contributor: Timothée Ravier <tim@siosm.fr>
# Contributor: Nicky726 (Nicky726 <at> gmail <dot> com)
# Contributor: Sergej Pupykin (pupykin <dot> s+arch <at> gmail <dot> com)
# Contributor: angelux/xangelux (xangelux <at> gmail <dot> com)
#
# This PKGBUILD is maintained on https://github.com/archlinuxhardened/selinux.
# If you want to help keep it up to date, please open a Pull Request there.

pkgname=policycoreutils
pkgver=3.0
pkgrel=1
pkgdesc="SELinux policy core utilities"
arch=('i686' 'x86_64')
url='http://userspace.selinuxproject.org'
license=('GPL2')
groups=('selinux')
depends=('libsemanage>=2.7' 'pam')
optdepends=('mcstrans: SELinux MCS translation daemon'
            'restorecond: SELinux daemon that fixes SELinux file contexts'
            'selinux-dbus-config: D-Bus configuration for SELinux'
            'selinux-gui: GUI tools for SELinux'
            'selinux-python: Python tools and libraries for SELinux'
            'selinux-sandbox: sandboxing tool for SELinux'
            'semodule-utils: SELinux module tools')
conflicts=("selinux-usr-${pkgname}")
provides=("selinux-usr-${pkgname}=${pkgver}-${pkgrel}")
source=("https://github.com/SELinuxProject/selinux/releases/download/20191204/${pkgname}-${pkgver}.tar.gz")
sha256sums=('3379c9bd722e36be9bf8856c6fa373bfa9b33305ac9da5fc807cfe7fa605f489')

build() {
  cd "${pkgname}-${pkgver}"
  make LSPP_PRIV=y all
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" LIBEXECDIR=/usr/lib SBINDIR=/usr/bin install
}
