# Maintainer: Patrick Oppenlander <patrick dot oppenlander at gmail dot com>
pkgname=libtomcrypt-git
pkgver=1.17.r379.gaeaa6d4
pkgrel=1
pkgdesc="A fairly comprehensive, modular and portable cryptographic toolkit."
arch=('i686' 'x86_64')
url="http://www.libtom.net"
license=('custom')
depends=('gmp')
makedepends=('git' 'gmp')
provides=('libtomcrypt')
conflicts=('libtomcrypt')
options=()
source=('git+https://github.com/libtom/libtomcrypt.git')
md5sums=('SKIP')

pkgver() {
  cd $srcdir/libtomcrypt
  git describe --long --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  cd $srcdir/libtomcrypt
  CFLAGS="-DGMP_DESC" \
  EXTRALIBS="-lgmp" \
  make -f makefile.shared INSTALL_GROUP=root NODOCS=1 DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
