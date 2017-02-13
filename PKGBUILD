# $Id: PKGBUILD 134819 2015-06-05 05:13:15Z lcarlier $
# Maintainer: Florian Pritz <flo@xssn.at>

_pkgbasename=libmng
pkgname=lib32-$_pkgbasename
pkgver=2.0.3
pkgrel=3
pkgdesc="A collection of routines used to create and manipulate MNG format graphics files (32-bit)"
arch=('x86_64')
url="http://www.libmng.com/"
license=('custom')
depends=('lib32-lcms2' $_pkgbasename)
makedepends=(gcc-multilib)
source=(http://downloads.sourceforge.net/sourceforge/${_pkgbasename}/${_pkgbasename}-${pkgver}.tar.xz{,.asc})
validpgpkeys=(8048643BA2C840F4F92A195FF54984BFA16C640F)
sha1sums=('0f141482ffcef6f8cd4413f945a59310ac2e49af'
          'SKIP')

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd $_pkgbasename-$pkgver
  ./configure --prefix=/usr --libdir=/usr/lib32
  make
}

package() {
  cd $_pkgbasename-$pkgver

  make DESTDIR=$pkgdir install

  rm -rf "${pkgdir}"/usr/{include,share,bin}
  mkdir -p "$pkgdir/usr/share/licenses"
  ln -s $_pkgbasename "$pkgdir/usr/share/licenses/$pkgname"
}
