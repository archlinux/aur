# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>
# Contributor: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>

pkgname=sc-im
pkgver=0.4.0
pkgrel=1
pkgdesc='A spreadsheet program based on SC'
arch=('i686' 'x86_64')
url='https://github.com/andmarti1424/sc-im'
depends=('ncurses')
license=('BSD')
conflicts=('scim-spreadsheet')
source=("https://github.com/andmarti1424/$pkgname/archive/v${pkgver}.tar.gz"
        'fix_backspace.patch')
sha256sums=('e9a6d0a87d4f9a657bb8b87bdde9141e42c8916fbb6879d07564ffb67302f68a'
            'c8e2268f1491c072d5d8c11ae682983f6d30a8b30f5a5a0c4fcc9811c659b329')
MAKEFLAGS='-j1'

prepare() {
  cd "$pkgname-$pkgver/src"
  # apply patch to make backspace work
  patch <../../../fix_backspace.patch
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
