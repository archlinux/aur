# Maintainer: Nicolas Iooss (nicolas <dot> iooss <at> m4x <dot> org)
#
# This PKGBUILD is maintained on https://github.com/archlinuxhardened/selinux.
# If you want to help keep it up to date, please open a Pull Request there.

pkgname=selinux-gui
pkgver=2.8
pkgrel=1
pkgdesc="SELinux GUI tools"
groups=('selinux')
arch=('any')
url='https://github.com/SELinuxProject/selinux/wiki'
license=('GPL2')
depends=('python-gobject' 'hicolor-icon-theme' 'selinux-python' 'gtk3')
conflicts=('policycoreutils<2.7')
source=("https://raw.githubusercontent.com/wiki/SELinuxProject/selinux/files/releases/20180524/${pkgname}-${pkgver}.tar.gz")
sha256sums=('17acd3004f01f92b288cc1322317d7964f5039fb26ba1542b6713a7147a2351d')

build() {
  cd "${pkgname}-${pkgver}"
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  # Compile Python files into bytecode
  python -m compileall "${pkgdir}/usr/share/system-config-selinux"
}
