# Maintainer: Nicolas Iooss (nicolas <dot> iooss <at> m4x <dot> org)
#
# This PKGBUILD is maintained on https://github.com/archlinuxhardened/selinux.
# If you want to help keep it up to date, please open a Pull Request there.

pkgname=selinux-gui
pkgver=3.5
pkgrel=1
pkgdesc="SELinux GUI tools"
groups=('selinux')
arch=('any')
url='https://github.com/SELinuxProject/selinux/wiki'
license=('GPL2')
depends=('python-gobject' 'hicolor-icon-theme' 'selinux-python' 'gtk3')
conflicts=('policycoreutils<2.7')
validpgpkeys=(
  '63191CE94183098689CAB8DB7EF137EC935B0EAF'  # Jason Zaman <perfinion@gentoo.org>
  'E853C1848B0185CF42864DF363A8AD4B982C4373'  # Petr Lautrbach <plautrba@redhat.com>
)
source=("https://github.com/SELinuxProject/selinux/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz"{,.asc})
sha256sums=('b90be664a7d1b20e5bde347c36bcf62693264b9b6e9e1ee2abc14159339434c8'
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
