# Maintainer: Nicolas Iooss (nicolas <dot> iooss <at> m4x <dot> org)
#
# This PKGBUILD is maintained on https://github.com/archlinuxhardened/selinux.
# If you want to help keep it up to date, please open a Pull Request there.

pkgname=secilc
pkgver=3.11
pkgrel=1
pkgdesc="SELinux Common Intermediate Language Compiler"
groups=('selinux')
arch=('i686' 'x86_64' 'aarch64')
url='https://github.com/SELinuxProject/cil/wiki'
license=('custom')
makedepends=('xmlto' 'docbook-xml' 'docbook-xsl')
checkdepends=('checkpolicy')
depends=('libsepol>=3.11')
validpgpkeys=(
  '63191CE94183098689CAB8DB7EF137EC935B0EAF'  # Jason Zaman <perfinion@gentoo.org>
  '68D21823342A13683AEB3E4EFB4C685B5DC1C13E'  # Petr Lautrbach <lautrbach@redhat.com>
)
source=("https://github.com/SELinuxProject/selinux/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz"{,.asc})
sha256sums=('1fb7de005d35ae0ac6ff8f8fc955d08a15b5c1a67e961b97ef987576af0db11a'
            'SKIP')

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

  install -Dm 0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
