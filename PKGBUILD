# Maintainer: Nicolas Iooss (nicolas <dot> iooss <at> m4x <dot> org)
#
# This PKGBUILD is maintained on https://github.com/archlinuxhardened/selinux.
# If you want to help keep it up to date, please open a Pull Request there.

pkgname=secilc
pkgver=3.2
pkgrel=1
pkgdesc="SELinux Common Intermediate Language Compiler"
groups=('selinux')
arch=('i686' 'x86_64' 'aarch64')
url='https://github.com/SELinuxProject/cil/wiki'
license=('custom')
makedepends=('xmlto' 'docbook-xml' 'docbook-xsl')
checkdepends=('checkpolicy')
depends=('libsepol>=3.1')
source=("https://github.com/SELinuxProject/selinux/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('5f6e6528a281b29ac5e558babffc3d8aab682fd8df8977daff5f266a50292cc3')

build() {
  cd "${pkgname}-${pkgver}"
  make all
}

check() {
  cd "${pkgname}-${pkgver}"
  make test
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  install -Dm 0644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
