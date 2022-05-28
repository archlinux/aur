# Maintainer: Nicolas Iooss (nicolas <dot> iooss <at> m4x <dot> org)
#
# This PKGBUILD is maintained on https://github.com/archlinuxhardened/selinux.
# If you want to help keep it up to date, please open a Pull Request there.

pkgname=selinux-gui
pkgver=3.4
pkgrel=1
pkgdesc="SELinux GUI tools"
groups=('selinux')
arch=('any')
url='https://github.com/SELinuxProject/selinux/wiki'
license=('GPL2')
depends=('python-gobject' 'hicolor-icon-theme' 'selinux-python' 'gtk3')
conflicts=('policycoreutils<2.7')
validpgpkeys=('E853C1848B0185CF42864DF363A8AD4B982C4373')  # Petr Lautrbach <plautrba@redhat.com>
source=("https://github.com/SELinuxProject/selinux/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz"{,.asc})
sha256sums=('cebd28d16fbd2cd4f21e5a9dd0f4de122c2014b5b00d8d351eec0890a3488637'
            'SKIP')

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
