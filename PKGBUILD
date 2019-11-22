# Maintainer: Nicolas Iooss (nicolas <dot> iooss <at> m4x <dot> org)
#
# This PKGBUILD is maintained on https://github.com/archlinuxhardened/selinux.
# If you want to help keep it up to date, please open a Pull Request there.

pkgname=selinux-gui
pkgver=2.9
pkgrel=2
pkgdesc="SELinux GUI tools"
groups=('selinux')
arch=('any')
url='https://github.com/SELinuxProject/selinux/wiki'
license=('GPL2')
depends=('python-gobject' 'hicolor-icon-theme' 'selinux-python' 'gtk3')
conflicts=('policycoreutils<2.7')
source=("https://github.com/SELinuxProject/selinux/releases/download/20190315/${pkgname}-${pkgver}.tar.gz")
sha256sums=('bbd9e1799cc0c22d64c815c3033a54393f6f84947ff2841a4df60ded5eee0510')

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
