# Maintainer: Nicolas Iooss (nicolas <dot> iooss <at> m4x <dot> org)
#
# This PKGBUILD is maintained on https://github.com/archlinuxhardened/selinux.
# If you want to help keep it up to date, please open a Pull Request there.

pkgname=secilc
pkgver=2.9
pkgrel=1
pkgdesc="SELinux Common Intermediate Language Compiler"
groups=('selinux')
arch=('i686' 'x86_64')
url='https://github.com/SELinuxProject/cil/wiki'
license=('custom')
makedepends=('xmlto' 'docbook-xml' 'docbook-xsl')
depends=('libsepol>=2.9')
source=("https://github.com/SELinuxProject/selinux/releases/download/20190315/${pkgname}-${pkgver}.tar.gz")
sha256sums=('73a1806e33a669e23545da2d35d0e5038714721f6bf71974eaa533b3ebde61b2')

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
