# Maintainer: John D Jones III jnbek1972 at gmail dot com
# 18 Apr 2015

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
source=('http://mirrors.zoelife4u.org/fly/fly-2.0.1.tar.gz'
	gccopts.patch)
md5sums=('a0fcb1fb26b680fad9e9578925e78c31'
         '316eb1cd0a8bc3f797d6cb4f85ec719f')

package() {
  cd $pkgname-$pkgver
  rm -f fly.o
  patch -p1 -i ../gccopts.patch || return 1
  make || return 1
  mkdir -p $pkgdir/usr/bin
  install -m 0755 $pkgname $pkgdir/usr/bin/$pkgname
}
