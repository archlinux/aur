# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: eric <eric@archlinux.org>
# Contributor: Manolis Tzanidakis

pkgname=checkpassword
pkgver=0.90
pkgrel=1
pkgdesc="A simple, uniform password-checking interface to all root applications"
arch=('i686' 'x86_64')
url="http://cr.yp.to/checkpwd.html"
license=('custom: as-is')
source=(http://cr.yp.to/checkpwd/$pkgname-$pkgver.tar.gz)
md5sums=('e75842e908f96571ae56c3da499ba1fc')

prepare() {
  cd "${srcdir}"/$pkgname-$pkgver

# fix errno.h in glibc-2.3.x
  sed -i "s:extern int errno;:#include <errno.h>:" error.h 
  echo "gcc ${CFLAGS}" > conf-cc
}

build() {
  cd "${srcdir}"/$pkgname-$pkgver

  make
}

package() {
  cd "${srcdir}"/$pkgname-$pkgver

  install -Dm755 $pkgname "${pkgdir}"/usr/bin/$pkgname
#license
  install -Dm644 README "${pkgdir}"/usr/share/licenses/$pkgname/README
}
