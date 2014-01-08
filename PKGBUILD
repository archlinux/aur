# Maintainer: carstene1ns <url/mail: arch carsten-teibes de>
# Contributor: Dany Martineau <dany.luc.martineau at gmail.com>
# Contributor: Larryhaja  <larryhaja at gmail.com>

pkgname=methane
pkgver=1.5.1
pkgrel=4
pkgdesc="Help the Super Methane Brothers to capture baddies with your gas gun"
arch=('i686' 'x86_64')
url="http://methane.sourceforge.net"
license=('GPL')
depends=('clanlib-23')
source=("http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tgz"
        "$pkgname.png"
        "$pkgname.desktop"
        "$pkgname-clanlib23.patch"
        "$pkgname-nogl1.patch")
sha256sums=('ac1de7009e638c784b4d413b56a4387be94a31bd5fe3050db7b51e39ccfdd248'
            '6c56b025b058a954bd089850dc50f4f25b292da97bbba0d4315db4060152f1fe'
            'cdbd5cbe9af04eff5bd7b8a467bd39fdbdefb77a4728d09347ee09c64d947d17'
            'd7318ef7004cce6bb3de04c76b1d3d15d26265310a5d3938f2efa6c183f4a346'
            '3b2426f27f45b232caf69d21eb1f79e8db3f7041bc6255eb20fe0fc0aae970a5')

prepare() {
  cd $pkgname-$pkgver

  # clanlib related changes
  patch -Np1 < ../$pkgname-clanlib23.patch
  # remove opengl1 renderer
  patch -Np1 < ../$pkgname-nogl1.patch
}

build() {
  cd $pkgname-$pkgver

  # remove leftover build dir
  rm -rf build
  make
}

package() {
  cd $pkgname-$pkgver

  # install desktop entry
  install -Dm644 ../$pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
  install -Dm644 ../$pkgname.png "$pkgdir"/usr/share/pixmaps/$pkgname.png

  # install data and executable
  install -d "$pkgdir"/usr/share/$pkgname
  cp -r {resources,docs} "$pkgdir"/usr/share/$pkgname
  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
}
