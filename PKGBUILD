# Maintainer: Markus Schaaf <markuschaaf@gmail.com>
pkgname=minidjvu
pkgver=0.8
pkgrel=4
pkgdesc='Highly efficient DjVu encoder for black-and-white images'
arch=(i686 x86_64)
url="http://$pkgname.sourceforge.net/"
license=(GPL)
depends=(libtiff)
source=("http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=(b354eb74d83c6e2d91aab2a6c2879ba7)

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --libdir=/usr/lib
  sed -i -e 's#-9 \$(MANDIR)#-9 $(DESTDIR)$(MANDIR)#' Makefile
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -d "$pkgdir"/usr/{bin,lib,share/man/man1}
  make DESTDIR="$pkgdir/" install
}

