# Maintainer: Jonathan Steel <jsteel at archlinux.org>
# Contributor: Ido Rosen <ido@kernel.org>
# Contributor: Army
# Contributor: Jay Tanzman <jay at jt512 dot dynddns dot ort>
# Contributor: Ray Kohler <ataraxia937 at gmail dot com>

pkgname=sc
pkgver=7.16
pkgrel=8
pkgdesc="Ncurses-based spreadsheet program"
arch=('x86_64')
url="https://ibiblio.org/pub/linux/apps/financial/spreadsheet/!INDEX.html"
license=('Public Domain')
depends=('ncurses')
source=(https://ibiblio.org/pub/linux/apps/financial/spreadsheet/$pkgname-$pkgver.tar.gz
        https://launchpadlibrarian.net/1281150/${pkgname}_$pkgver-2.diff.gz)
md5sums=('1db636e9b2dc7cd73c40aeece6852d47'
         '83d5d8a4b5ffb4e85da887b63c49f2ff')

build() {
  cd $pkgname-$pkgver

  patch -p1 -i "$srcdir"/${pkgname}_$pkgver-2.diff

  make
  make sc.1 psc.1
}

package() {
  cd $pkgname-$pkgver

  install -d "$pkgdir"/usr/bin "$pkgdir"/usr/share/doc/$pkgname \
    "$pkgdir"/usr/share/man/man1 "$pkgdir"/usr/share/licenses/$pkgname

  make prefix="$pkgdir"/usr MANDIR="$pkgdir"/usr/share/man/man1 install

  echo "This program is in the public domain." > \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
