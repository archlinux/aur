# Maintainer: Nicolas Iooss (nicolas <dot> iooss <at> m4x <dot> org)
# Contributor: Timothée Ravier <tim@siosm.fr>
# Contributor: Nicky726 (Nicky726 <at> gmail <dot> com)
# Contributor: Sergej Pupykin (pupykin <dot> s+arch <at> gmail <dot> com)
# Contributor: angelux/xangelux (xangelux <at> gmail <dot> com)

pkgname=policycoreutils
pkgver=2.7
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
source=("https://raw.githubusercontent.com/wiki/SELinuxProject/selinux/files/releases/20170804/${pkgname}-${pkgver}.tar.gz")
sha256sums=('0a1b8a4a323b854981c6755ff025fe98a0f1cff307f109abb260f0490f13e4f4')

build() {
  cd "${pkgname}-${pkgver}"

  make LSPP_PRIV=y all
}

package() {
  cd "${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" \
    LIBEXECDIR="${pkgdir}/usr/lib" \
    SBINDIR="${pkgdir}/usr/bin" \
    install
}
