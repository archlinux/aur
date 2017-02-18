# Contributor: Llewelyn Trahaearn <woefulderelict [at] gmail [dot] com>
# Contributor: Florian Pritz <flo [at] xssn [dot] at>

pkgname=lib32-libmng
pkgver=2.0.3
pkgrel=1
pkgdesc="A collection of routines used to create and manipulate MNG format graphics files (32-bit)"
arch=('x86_64')
url="http://www.libmng.com/"
license=('custom')
depends=('lib32-lcms2' "${pkgname#lib32-}" )
makedepends=('gcc-multilib')
source=(http://downloads.sourceforge.net/sourceforge/${pkgname#lib32-}/${pkgname#lib32-}-${pkgver}.tar.xz{,.asc})
validpgpkeys=(8048643BA2C840F4F92A195FF54984BFA16C640F)
sha1sums=('0f141482ffcef6f8cd4413f945a59310ac2e49af'
          'SKIP')

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_LIBDIR='/usr/lib32/pkgconfig'

  cd ${pkgname#lib32-}-${pkgver}
  ./configure --prefix=/usr --libdir=/usr/lib32
  make
}

package() {
  cd ${pkgname#lib32-}-${pkgver}
  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/{include,share,bin}
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
