# Maintainer: Daniel Nagy <danielnagy at gmx de>

pkgname=sendip
pkgver=2.5
pkgrel=4
pkgdesc="A commandline tool to allow sending arbitrary IP packets."
arch=('i686' 'x86_64' )
license=('GPL')
depends=('glibc')
url="http://www.earth.li/projectpurple/progs/sendip.html"
source=("http://www.earth.li/projectpurple/files/sendip-$pkgver.tar.gz" "$pkgname-$pkgver.patch" )
sha1sums=('478fee7b67134cbcc0f353dbb12dbd54625d7b01'
          '083883400bcf6190131253ca9ea1a12d5362722a')

prepare() {
  cd "${srcdir}"/$pkgname-$pkgver
  sed -i "s#-fPIC#& -O2#" Makefile
  # patch the source code
  patch < "$srcdir"/$pkgname-$pkgver.patch
  sed -i 's|_BSD_SOURCE|_DEFAULT_SOURCE|' csum.c
}

build() {
  cd "${srcdir}"/$pkgname-$pkgver
  make PREFIX=/usr
}

package() {
  cd "${srcdir}"/$pkgname-$pkgver
  make PREFIX=$pkgdir/usr install
}
