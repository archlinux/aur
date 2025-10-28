# Maintainer: Denis Kasak <dkasak|AT|termina.org.uk>
# Contributor: Hilton Medeiros <medeiros.hilton at gmail tod com>
# Contributor: Tony Dodd <arch@recalcitrance.net>
# Contributor: Mark Taylor <skymt0@gmail.com>

pkgname=contextfree
pkgver=3.4.2_2
pkgrel=2
pkgdesc="A program that generates images from written instructions called a grammar"
arch=('i686' 'x86_64')
url="https://github.com/MtnViewJohn/context-free"
license=('GPL2')
depends=('libpng' 'gcc-libs')
makedepends=('bison' 'flex')
source=("https://github.com/MtnViewJohn/context-free/archive/refs/tags/Version${pkgver}.tar.gz")
sha256sums=('a3e294a31afa596a0bbbe271b88d5ca19f8b7c5e54f6a48256878fa797b8dc77')

prepare() {
  cd "$srcdir/context-free-Version$pkgver"

  make clean
  sed -i 's/c++14/c++17/' Makefile
}

build() {
  cd "$srcdir/context-free-Version$pkgver"

  make
}

package() {
  cd "$srcdir/context-free-Version$pkgver"

  install -Dm755 cfdg "$pkgdir/usr/bin/cfdg"
  install -d "$pkgdir/usr/share/$pkgname"
  cp -r input "$pkgdir/usr/share/$pkgname/examples"
}
