# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=streem
pkgver=201606
pkgrel=1
pkgdesc="Stream based concurrent scripting language"
arch=('i686' 'x86_64')
makedepends=('bison' 'flex' 'gcc' 'make')
url="https://github.com/matz/streem"
license=('MIT')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/matz/$pkgname/tar.gz/$pkgver)
sha256sums=('e1d50af062e8a53af0afcc0349dba1101bf1bfecba6df8cc2ecb52f02309a1a9')
install=streem.install

build() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Building...'
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Installing license...'
  install -dm 755 "$pkgdir/usr/share/licenses/streem"
  mv LICENSE "$pkgdir/usr/share/licenses/streem"

  msg2 'Installing documentation...'
  install -dm 755 "$pkgdir/usr/share/doc/streem"
  mv README.md examples "$pkgdir/usr/share/doc/streem"

  msg2 'Installing...'
  install -dm 755 "$pkgdir/usr/share/streem"
  tar -c . | tar -x -C "$pkgdir/usr/share/streem"

  msg2 'Cleaning up pkgdir...'
  find "$pkgdir" -type f -name .gitignore -exec rm -r '{}' +
}
