# Maintainer: Nicolas Iooss (nicolas <dot> iooss <at> m4x <dot> org)
#
# This PKGBUILD is maintained on https://github.com/archlinuxhardened/selinux.
# If you want to help keep it up to date, please open a Pull Request there.

pkgname=secilc
pkgver=3.0
pkgrel=1
pkgdesc="SELinux Common Intermediate Language Compiler"
groups=('selinux')
arch=('i686' 'x86_64')
url='https://github.com/SELinuxProject/cil/wiki'
license=('custom')
makedepends=('xmlto' 'docbook-xml' 'docbook-xsl')
depends=('libsepol>=3.0')
source=("https://github.com/SELinuxProject/selinux/releases/download/20191204/${pkgname}-${pkgver}.tar.gz")
sha256sums=('78fafc4a8a8a212663d3d1e181047f5605430f0a0577ff772a4bb7fecd2b42b0')

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
