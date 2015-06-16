# Maintainer: Christos Nouskas <nous at archlinux dot us>
# 29 May 2010

pkgname=fly
pkgver=2.0.1
pkgrel=1
pkgdesc="fly is a C program that creates PNG, JPEG or GIF images on the fly from CGI and other programs."
arch=('i686' 'x86_64')
url="http://martin.gleeson.com/fly/"
license=('Free')
depends=('gd' 'freetype2' 'libjpeg' 'libpng')
makedepends=('gcc')
options=('strip')
source=(http://martin.gleeson.com/fly/dist/fly-2.0.1.tar.gz
	gccopts.patch)
md5sums=('3b3db9c00c7abc77f5d70ddc206a1942'
         '316eb1cd0a8bc3f797d6cb4f85ec719f')

build() {
  cd $srcdir/$pkgname-$pkgver
  rm -f fly.o
  patch -p1 -i $srcdir/gccopts.patch || return 1
  make || return 1
  mkdir -p $pkgdir/usr/bin
  install -m 0755 $srcdir/$pkgname-$pkgver/$pkgname $pkgdir/usr/bin/$pkgname
}
