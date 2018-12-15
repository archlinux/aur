# Contributor: sekret
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Henning Garus <henning.garus@gmail.com>
# Contributor: Joshua Stiefer <facedelajunk@gmail.com>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=wordgrinder
pkgver=0.7.2
pkgrel=1
pkgdesc="A word processor for processing words."
url="http://cowlark.com/wordgrinder/"
arch=('i686' 'x86_64')
license=('MIT')
makedepends=(ninja)
checkdepends=()
depends=('lua' 'lua52' 'lua52-filesystem' 'libx11' 'libxft' 'freetype2' 'zlib')
source=("https://github.com/davidgiven/$pkgname/archive/${pkgver}.tar.gz")
md5sums=('4c754fddfe29c2038a1c96d38ba49c74')
sha1sums=('2978975ed122e9deb0bae32fffbaabbcb434e15a')
sha256sums=('4e1bc659403f98479fe8619655f901c8c03eb87743374548b4d20a41d31d1dff')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i '7s!$(HOME)!'$pkgdir'/usr!' Makefile
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX="$pkgdir/usr" install
  cd licenses
  for i in COPYING.Lua COPYING.LuaBitOp COPYING.LuaFileSystem \
           COPYING.Minizip COPYING.Scowl COPYING.uthash COPYING.wcwidth \
           COPYING.WordGrinder COPYING.xpattern; do
  install -Dm644 $i "$pkgdir/usr/share/licenses/$pkgname/$i"
  done
}

