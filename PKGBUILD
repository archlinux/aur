# Maintainer: carstene1ns <arch carsten-teibes de>
# Contributor: Dany Martineau <dany.luc.martineau at gmail.com>
# Contributor: Larryhaja  <larryhaja at gmail.com>

pkgname=methane
pkgver=1.5.1
pkgrel=4
pkgdesc="Help the Super Methane Brothers to capture baddies with your gas gun."
arch=('i686' 'x86_64')
url="http://methane.sourceforge.net"
license=('GPL')
depends=('clanlib-23')
source=("http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tgz"
        "$pkgname.desktop"
        "$pkgname.png"
        "$pkgname-clanlib23.patch"
        "$pkgname-nogl1.patch")
md5sums=('7e4258e326478678c2332388eab2ed14'
         'ee0ebbf6138142365f5c1a287d1691a6'
         'a9ec845554b4987c02723b87d308e573'
         'ca3b7c6d7e959914e086882d40f8d810'
         'c6237f8fc6ebaa95b0ee7ff1caabe69f')
sha256sums=('ac1de7009e638c784b4d413b56a4387be94a31bd5fe3050db7b51e39ccfdd248'
            'cdbd5cbe9af04eff5bd7b8a467bd39fdbdefb77a4728d09347ee09c64d947d17'
            '6c56b025b058a954bd089850dc50f4f25b292da97bbba0d4315db4060152f1fe'
            'd7318ef7004cce6bb3de04c76b1d3d15d26265310a5d3938f2efa6c183f4a346'
            '3b2426f27f45b232caf69d21eb1f79e8db3f7041bc6255eb20fe0fc0aae970a5')

prepare() {
  cd $srcdir/$pkgname-$pkgver

  # clanlib related changes
  patch -Np1 -i $srcdir/$pkgname-clanlib23.patch
  # remove opengl1 renderer
  patch -Np1 -i $srcdir/$pkgname-nogl1.patch
}

build() {
  cd $srcdir/$pkgname-$pkgver

  # remove leftover build dir
  rm -fR build

  make
}

package() {
  cd $srcdir/$pkgname-$pkgver

  mkdir -p $pkgdir/usr/share/$pkgname
  mkdir $pkgdir/usr/bin

  # install desktop entry
  install -Dm644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
  install -Dm644 $srcdir/$pkgname.png $pkgdir/usr/share/pixmaps/$pkgname.png

  # install data and executable
  cp -R {resources,docs} $pkgdir/usr/share/$pkgname
  install -m755 $pkgname $pkgdir/usr/bin
}
