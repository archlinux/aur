# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>
# Contributor: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>

pkgname=sc-im
pkgver=0.3.0
pkgrel=2
pkgdesc='A spreadsheet program based on SC'
arch=('i686' 'x86_64')
url='https://github.com/andmarti1424/sc-im'
license=('BSD')
conflicts=('scim-spreadsheet')
source=("https://github.com/andmarti1424/$pkgname/archive/v${pkgver}.tar.gz"
        'fix_backspace.patch')
sha256sums=('d721e8fb850ebe3c590311ab14e37e92b3340a19e41cdfd67798fdcfac6fae3b'
            'c8e2268f1491c072d5d8c11ae682983f6d30a8b30f5a5a0c4fcc9811c659b329')
MAKEFLAGS='-j1'

prepare() {
  cd "$pkgname-$pkgver/src"
  # required to make properly
  sed -i 's/#include <ncursesw\/curses.h>/#include <ncurses.h>/' *.c *.h
}

build() {
  cd "$pkgname-$pkgver/src"
  make
}

package() {
  cd "$pkgname-$pkgver/src"
  make DESTDIR="$pkgdir" install

  install -D -m644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
