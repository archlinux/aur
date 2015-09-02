# Maintainer:  TDY <tdy@archlinux.info>
# Contributor: Dmitry N. Shilov aka StormBlast <stormblast@land.ru>

pkgname=searchmonkey
pkgver=2.0.0
pkgrel=2
pkgdesc="A powerful GUI search utility for matching regex patterns"
arch=('i686' 'x86_64')
url="http://searchmonkey.sourceforge.net/"
license=('GPL3')
depends=('qt4')
source=(http://downloads.sourceforge.net/$pkgname/${pkgname}_v$pkgver.zip
        $pkgname-$pkgver-gcc47.diff
        $pkgname.desktop)
md5sums=('239a8171d54c10810da6b131ba5fbd64'
         '86841c3796e149cd12e5b3a27cdfc170'
         '5535ab5a696309d44cc68c8d15f59693')

build() {
  cd "$srcdir/${pkgname}_v$pkgver"
  patch -Np1 -i ../$pkgname-$pkgver-gcc47.diff
  qmake-qt4 && make
}

package() {
  cd "$srcdir/${pkgname}_v$pkgver"
  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm644 ../$pkgname.desktop \
    "$pkgdir/usr/share/applications/$pkgname.desktop"
}

# vim:set ts=2 sw=2 et:
