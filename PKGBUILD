# Maintainer: Nicolas Iooss (nicolas <dot> iooss <at> m4x <dot> org)
#
# This PKGBUILD is maintained on https://github.com/archlinuxhardened/selinux.
# If you want to help keep it up to date, please open a Pull Request there.

pkgname=secilc
pkgver=3.1
pkgrel=1
pkgdesc="SELinux Common Intermediate Language Compiler"
groups=('selinux')
arch=('i686' 'x86_64')
url='https://github.com/SELinuxProject/cil/wiki'
license=('custom')
makedepends=('xmlto' 'docbook-xml' 'docbook-xsl')
checkdepends=('checkpolicy')
depends=('libsepol>=3.1')
source=("https://github.com/SELinuxProject/selinux/releases/download/20200710/${pkgname}-${pkgver}.tar.gz")
sha256sums=('86117246fec3017af710a9ff7c1dae3ed1cd571e232a86cff3e2a3de2d6aa65c')

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
