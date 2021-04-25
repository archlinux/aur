# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=oak  
pkgver=1.5.0
pkgrel=2 
pkgdesc="Tool to monitor syslogs from a collection of servers"
url="http://www.ktools.org/oak/"
arch=('i686' 'x86_64')
license=('custom')
depends=('glibc')
makedepends=('smtp-server')
source=(https://www.ktools.org/dist/$pkgname/$pkgname-$pkgver.tar.gz)
sha256sums=('cc4e7efa32788eaaa139c2a7aab7dea297b6a4d71f17885cd6d9df492fec6079')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  install -Dm755 $pkgname-$pkgver/$pkgname "$pkgdir"/usr/bin/$pkgname
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  head -9 "$srcdir"/$pkgname-$pkgver/oak.c | cut -b 3- > \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
