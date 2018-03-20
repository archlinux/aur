# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=libxxhash
pkgver=0.6.4
pkgrel=1
pkgdesc="Extremely fast non-cryptographic hash algorithm (library)"
arch=('i686' 'x86_64')
makedepends=('make')
url="https://cyan4973.github.io/xxHash/"
license=('BSD')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/Cyan4973/xxHash/tar.gz/v$pkgver)
sha256sums=('4570ccd111df6b6386502791397906bf69b7371eb209af7d41debc2f074cdb22')
conflicts=('xxhash')

build() {
  cd "$srcdir/xxHash-$pkgver"

  msg2 'Building...'
  make lib
}

package() {
  cd "$srcdir/xxHash-$pkgver"

  msg2 'Installing license...'
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/libxxhash"

  msg2 'Installing...'
  make PREFIX='/usr' DESTDIR="$pkgdir" install lib

  msg2 'Removing unwanted binaries...'
  find "$pkgdir/usr/bin" -mindepth 1 -maxdepth 1 -exec rm '{}' +
  rmdir "$pkgdir/usr/bin"
}
