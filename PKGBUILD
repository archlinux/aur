# Maintainer: Nicolas Iooss (nicolas <dot> iooss <at> m4x <dot> org)

pkgname=restorecond
pkgver=2.7
pkgrel=1
pkgdesc="sandboxing tool for SELinux"
arch=('i686' 'x86_64')
url='https://github.com/SELinuxProject/selinux/wiki'
license=('GPL2')
groups=('selinux')
depends=('dbus-glib' 'libselinux>=2.7')
conflicts=('policycoreutils<2.7')
source=("https://raw.githubusercontent.com/wiki/SELinuxProject/selinux/files/releases/20170804/${pkgname}-${pkgver}.tar.gz")
sha256sums=('cb8e0a8d706cb2c1f105125f3514dffffefcbcfb49199183a7f91ab0bdf1f24d')

build() {
  cd "${pkgname}-${pkgver}"

  make
}

package() {
  cd "${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" SBINDIR="${pkgdir}/usr/bin" install

  # Remove restorecond init script
  rm -rf "${pkgdir}/etc/rc.d"
}
