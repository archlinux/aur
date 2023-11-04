# Maintainer: Pieter Lenaerts <pieter.aj.lenaerts@gmail.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=jpeginfo
pkgver=1.7.1
pkgrel=1
pkgdesc="Jpeg information utility"
arch=('i686' 'x86_64' 'aarch64')
url="https://www.kokkonen.net/tjko/projects.html"
license=('GPL')
depends=('libjpeg')
source=(https://www.kokkonen.net/tjko/src/$pkgname-$pkgver.tar.gz)
sha256sums=('274f6be23fd089bd9e8715b67643a66ca2f63a503028bdea3e571228d50b669e')

build() {
  cd $pkgname-$pkgver

  # Autotools are from 2003. We have to update local macros.
  aclocal

  unset CPPFLAGS # workaround unable to find jpeglib
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  install -d $pkgdir/usr/share/man/man1
  make prefix="$pkgdir/usr" install
}
