# Maintainer: Boohbah <boohbah at gmail.com>

pkgname=oneko
pkgver=1.2.sakura.5
pkgrel=1
pkgdesc="A modified version of oneko. KINOMOTO Sakura chases around your mouse cursor."
arch=('i686' 'x86_64')
url="http://www.daidouji.com/oneko/"
license=('Unknown')
depends=('libx11')
makedepends=('libxext')
source=("http://www.daidouji.com/oneko/distfiles/$pkgname-$pkgver.tar.gz"
        'add-includes.patch')
md5sums=('456b318fa6e61431bf4f0a42b110014a'
         'fae2e02a36ececa2bcf13e08afa2bd95')

prepare() {
  cd "$pkgname-$pkgver"
  patch -p1 -i "$srcdir/add-includes.patch"
}

build() {
  cd "$pkgname-$pkgver"
  gcc -lm -lX11 -o oneko oneko.c
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 oneko "$pkgdir/usr/bin/oneko"
  install -Dm644 oneko.man "$pkgdir/usr/share/man/man6/oneko.6"
  mkdir "$pkgdir/usr/share/oneko"
  cp -a bitmaps bitmasks cursors "$pkgdir/usr/share/oneko"
}

# vim:set ts=2 sw=2 et:
