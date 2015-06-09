# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=streem
pkgver=201507
pkgrel=1
pkgdesc="Stream based concurrent scripting language"
arch=('i686' 'x86_64')
makedepends=('bison' 'flex' 'gcc' 'make')
url="https://github.com/matz/streem"
license=('MIT')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/matz/$pkgname/tar.gz/$pkgver)
sha256sums=('e2893b98148a2ad64476dfeb1f90eae258b7d6e2af971c6ca8fc62580035db2f')
install=streem.install

build() {
  cd "$srcdir/$pkgname-$pkgver"

  msg 'Building...'
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  msg 'Installing license...'
  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/streem/LICENSE"

  msg 'Installing documentation...'
  install -dm 755 "$pkgdir/usr/share/doc/streem"
  cp -dpr --no-preserve=owner README.md examples "$pkgdir/usr/share/doc/streem"

  msg 'Installing...'
  install -dm 755 "$pkgdir/usr/share/streem"
  tar -c . | tar -x -C "$pkgdir/usr/share/streem"
}
