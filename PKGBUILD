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
sha256sums=('1997a00b6d82d189b65f6fd2a856a34992abc99e50d9ec463bbf1afb750d1765'
            '37116b9619790564650c4090b4a6264c08aa59fa1e24c63ca073011cd70507cb')

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
