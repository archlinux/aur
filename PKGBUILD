# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=halibut  
pkgver=1.3
pkgrel=1
pkgdesc="free document preparation system"
url="http://www.chiark.greenend.org.uk/~sgtatham/halibut/"
arch=('i686' 'x86_64')
license=('custom:MIT')
depends=('glibc')
makedepends=('cmake')
source=(https://www.chiark.greenend.org.uk/~sgtatham/$pkgname/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('aaa0f7696f17f74f42d97d0880aa088f5d68ed3079f3ed15d13b6e74909d3132')

build() {
  cd $pkgname-$pkgver
  cmake . -DCMAKE_INSTALL_PREFIX:PATH=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  install -Dm644 LICENCE "$pkgdir"/usr/share/licenses/$pkgname/LICENCE 
  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname 
  cd doc
  install -Dm644 $pkgname.1 "$pkgdir"/usr/share/man/man1/$pkgname.1
  cd manual
  for _i in $pkgname.info* 
  do 
    install -Dm644 $_i "$pkgdir"/usr/share/info/$_i 
  done
  for _i in $pkgname{.ps,.pdf,.txt}
  do 
    install -Dm644 $_i "$pkgdir"/usr/share/doc/$pkgname/$_i
  done
}
