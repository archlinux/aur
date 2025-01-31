# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Ryan Farley <ryan.farley@gmx.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Krzysztof Stasiorowski <krzysiekst@gmail.com>
# Contribute : Daniel Kamil Kozar <dkk089@gmail.com>

pkgname=qpxtool-unofficial-git
pkgver=0.8.1
pkgrel=6
pkgdesc="Enhanced (unofficial) qpxtool version"
arch=('any')
url="https://github.com/speed47/qpxtool"
license=('GPL')
makedepends=('qt5-tools')
depends=('qt5-base')
source=(https://github.com/speed47/qpxtool.git)
md5sums=('SKIP')

prepare() {
  cd "${pkgname}-${pkgver}"
  patch -p0 -i ../fix-wrong-variable-in-comparison.diff
}

build() {
  cd "$srcdir"/$pkgname-$pkgver
  # Fix strict aliasing warnings
  export CFLAGS="$CFLAGS -fno-strict-aliasing"
  ./configure --prefix=/usr --sbindir=/usr/bin --libdir=/usr/lib
  make
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  mkdir -p "$pkgdir"/usr/bin
  make DESTDIR="$pkgdir" install
}
