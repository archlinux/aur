# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=streem
pkgver=201509
pkgrel=1
pkgdesc="Stream based concurrent scripting language"
arch=('i686' 'x86_64')
makedepends=('bison' 'flex' 'gcc' 'make')
url="https://github.com/matz/streem"
license=('MIT')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/matz/$pkgname/tar.gz/$pkgver)
sha256sums=('f914ce765121b568f2c7f14f7e1c120c93cbb4a01a80b5735824bd1655709a34')
install=streem.install

build() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Building...'
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Installing license...'
  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/streem/LICENSE"

  msg2 'Installing documentation...'
  install -dm 755 "$pkgdir/usr/share/doc/streem"
  cp -dpr --no-preserve=owner README.md examples "$pkgdir/usr/share/doc/streem"

  msg2 'Installing...'
  install -dm 755 "$pkgdir/usr/share/streem"
  tar -c . | tar -x -C "$pkgdir/usr/share/streem"

  msg2 'Cleaning up pkgdir...'
  find "$pkgdir" -type f -name .gitignore -exec rm -r '{}' +
}
