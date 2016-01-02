# Maintainer: Jonas Schürmann <jonasschuermann@aol.de>
# Contributor: Joshua Mendoza (joshua.mdza) <joshua.mdza@gmail.com>
# Contributor: Niel West (Nielke) <nielkie@gmail.com>
# Contributor: Bob_Sheep (Bob_Sheep) <bobsheep@gmail.com>
# Contributor: jordi Cerdan (jcerdan) <jcerdan@tecob.com>

pkgname=libunicap
pkgver=0.9.12
pkgrel=3
pkgdesc="Provides a uniform API for all kinds of video capture devices"
arch=('i686' 'x86_64')
conflicts=('unicap')
provides=('unicap')
url="http://unicap-imaging.org"
options=('!libtool')
license=('GPL')
depends=('libraw1394')
makedepends=('intltool')
source=("http://unicap-imaging.org/downloads/$pkgname-$pkgver.tar.gz" 'libunicap-0.9.12.patch')
md5sums=('353657b4da519251d4cc6dee5a232391' '7295cf7c8e8604c46f3b187d46c6920b')

prepare() {
  cd $srcdir/$pkgname-$pkgver
  patch -p1 < ../$pkgname-$pkgver.patch
}

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr --enable-vid21394-visca
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
}
