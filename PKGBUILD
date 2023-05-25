# Maintainer: Munzir Taha <munzirtaha@gmail.com>

pkgname=chessx
pkgver=1.6.0
pkgrel=1
pkgdesc="Cross-platform chess database and PGN viewer"
arch=(x86_64)
url=http://chessx.sourceforge.net
license=(GPL2)
depends=(qt5-svg qt5-speech)
makedepends=(qt5-tools)
conflicts=($pkgname-svn)
source=("https://sourceforge.net/projects/$pkgname/files/$pkgname/$pkgver/$pkgname-$pkgver.tgz"
        "chessx.patch")
sha256sums=('efa60e7b55a907ebdd12810a1931de69624ba42544e11a3262ed562f2dc3c618'
            'ed2464acb0547596017c38be8a4531206e3ff15d28b4f68d96ed26b0ffde3154')

prepare() {
    cd "$srcdir"
    patch --forward --strip=1 --input="${srcdir}/chessx.patch"
}

build() {
  cd $pkgname-$pkgver
  lrelease i18n/*.ts
  qmake
  make
}

package() {
  cd $pkgname-$pkgver
  install -Dm644 unix/$pkgname.desktop -t "$pkgdir/usr/share/applications/"
  install -Dm644 data/images/$pkgname.png -t "$pkgdir/usr/share/pixmaps/"
  install -Dm755 release/$pkgname $pkgdir/usr/bin/$pkgname
  install -Dm644 ChangeLog* README* -t "$pkgdir/usr/share/doc/$pkgname/"
}
