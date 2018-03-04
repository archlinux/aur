# Contributor: sekret
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Henning Garus <henning.garus@gmail.com>
# Contributor: Joshua Stiefer <facedelajunk@gmail.com>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=wordgrinder
pkgver=0.7.1
pkgrel=1
pkgdesc="A word processor for processing words."
url="http://cowlark.com/wordgrinder/"
arch=('i686' 'x86_64')
license=('MIT')
makedepends=(ninja)
checkdepends=()
depends=('lua' 'lua52' 'lua52-filesystem' 'libx11' 'libxft' 'freetype2' 'zlib')
source=("https://github.com/davidgiven/$pkgname/archive/${pkgver}.tar.gz")
md5sums=('593ae7f64770d52d2e75c9f3402b4df0')
sha1sums=('1fe2328cfee71620bbf4bfc04471cddc8abd14ca')
sha256sums=('54085af7963e1f67342bc0b1b20d1ccc75494f2e23d401b601cf3089acea747c')

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

