# Maintainer: carstene1ns <arch carsten-teibes de>
# Contributor: Heine Laursen <zannvip at gmail dot com>
# Contributor: Dany Martineau <dany.luc.martineau gmail com>

pkgname=liquidwar6
pkgver=0.0.13beta
pkgrel=3
pkgdesc="Your army is a blob of liquid and you have to try and eat your opponents. Complete rewrite of Liquidwar 5.x"
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/liquidwar6/"
license=('GPL')
depends=('sdl_image' 'sdl_mixer' 'sdl_ttf' 'gtk2' 'sqlite3' 'guile' 'glu' 'curl')
optdepends=("liquidwar6-extra-maps: contributed extra maps")
install="$pkgname.install"
source=("http://ftp.gnu.org/gnu/$pkgname/$pkgname-$pkgver.tar.gz"
        "$pkgname-libpng16.patch"
        "$pkgname-guile20-allinone.patch")
md5sums=('22aa3eef3868a446bee7838fca8efc25'
         '7ef870ee604757b7f2f01f0c35c20bd0'
         'cd0e0bd3d06245faf9fc912cef51d5c1')

prepare() {
  cd $pkgname-$pkgver

  # support for archs libpng 1.6
  patch < ../$pkgname-libpng16.patch

  # allinone target needs guile include
  patch -p2 < ../$pkgname-guile20-allinone.patch
}

build() {
  cd $pkgname-$pkgver

  ./configure --prefix=/usr --libexecdir=/usr/lib/$pkgname --disable-mod-csound --enable-optimize --enable-allinone

  make
}

package() {
  cd $pkgname-$pkgver

  make DESTDIR="$pkgdir/" install
}
