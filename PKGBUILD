# Contributor: sekret
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Henning Garus <henning.garus@gmail.com>
# Contributor: Joshua Stiefer <facedelajunk@gmail.com>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=wordgrinder
pkgver=0.7
pkgrel=1
pkgdesc="A word processor for processing words."
url="http://cowlark.com/wordgrinder/"
arch=('i686' 'x86_64')
license=('MIT')
makedepends=(ninja)
checkdepends=()
depends=('lua' 'lua52' 'lua52-filesystem' 'libx11' 'libxft' 'freetype2' 'zlib')
source=("https://github.com/davidgiven/$pkgname/archive/${pkgver}.tar.gz")
md5sums=('49feb4030fe62b6e7fb1c0bccdbaab78')
sha1sums=('0889e822b6c30cd7ff59696faf35fd70af4c10aa')
sha256sums=('8fef29d400af524dfdd0a82f595ec8a0ae989f923416b50140616a25b2993f43')

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
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

