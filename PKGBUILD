# Contributor: Nicolas Bigaouette <bigaouette@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=xsvg
pkgver=0.2.1
pkgrel=7
pkgdesc="A viewer of SVG files"
url="http://cairographics.org/"
license=('custom')
depends=('libsvg-cairo' 'libpng' 'libxinerama' 'libxrandr')
arch=('i686' 'x86_64')
source=("http://cairographics.org/snapshots/$pkgname-$pkgver.tar.gz" configure.in.patch)
md5sums=('f20409e87d9bff3c4d698d8c0e9e9f2b'
         'cae774a2a7b60ab4d4600415b8265314')

prepare() {
  cd $srcdir/$pkgname-$pkgver
  patch -p1 < $srcdir/configure.in.patch
  mv configure.in configure.ac
}

build() {
  cd $srcdir/$pkgname-$pkgver
  aclocal
  CC=gcc LDFLAGS="-lXinerama -lXrender -lX11 -lXrandr " ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make prefix=${pkgdir}/usr mandir=$pkgdir/usr/share/man install
  install -Dm644 COPYING ${pkgdir}/usr/share/licenses/$pkgname
}
