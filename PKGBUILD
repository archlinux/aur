# Maintainer: Nicolas Iooss (nicolas <dot> iooss <at> m4x <dot> org)
#
# This PKGBUILD is maintained on https://github.com/archlinuxhardened/selinux.
# If you want to help keep it up to date, please open a Pull Request there.

pkgname=restorecond
pkgver=3.4
pkgrel=1
pkgdesc="SELinux restorecon daemon"
arch=('i686' 'x86_64' 'aarch64')
url='https://github.com/SELinuxProject/selinux/wiki'
license=('GPL2')
groups=('selinux')
makedepends=('pkgconf')
depends=('dbus-glib' 'libselinux>=2.7')
conflicts=('policycoreutils<2.7')
validpgpkeys=('E853C1848B0185CF42864DF363A8AD4B982C4373')  # Petr Lautrbach <plautrba@redhat.com>
source=("https://github.com/SELinuxProject/selinux/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz"{,.asc})
sha256sums=('c7ace37dde5aed1eaebfcf43efc32f29a9babb93a430b666c4a5801f0211f5c2'
            'SKIP')

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
