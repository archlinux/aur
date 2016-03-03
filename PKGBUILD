# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=streem
pkgver=201604
pkgrel=1
pkgdesc="Stream based concurrent scripting language"
arch=('i686' 'x86_64')
makedepends=('bison' 'flex' 'gcc' 'make')
url="https://github.com/matz/streem"
license=('MIT')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/matz/$pkgname/tar.gz/$pkgver)
sha256sums=('6b91a058ac1f322c254d49849a3a546fcb2aef69c2ee739d9e93ee32ba34cddd')
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
