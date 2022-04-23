# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

pkgname=titokone
pkgver=1.4.0
pkgrel=1
pkgdesc="TTK-91 machine language simulator written in Java"
arch=(any)
url="https://github.com/titokone/titokone"
license=('LGPL')
depends=('java-runtime' 'bash')
makedepends=('maven')
source=("https://github.com/titokone/titokone/archive/titokone-${pkgver}.tar.gz"
        "titokone.sh")
sha512sums=('9424025e3890c90d146e8a1e4cb13f5148363987cc029c9d37dd347ab87c64310c47b877c4c30d377b4ec8f57c1749ef48689312ff604510c5aa707fdf062d63'
            '34ce34ad8f4d93c74a8fd98092eef2078aeb3745c8eb00b3f3c3f682a785367c27cee59cdbafa21ff4c755180873538b7b3bd31b7f5fbc13894095b97dec50a4')

prepare() {
  # Fix maven config
  sed -i -e 's/<source>1.6/<source>1.7/' \
      -e 's/<target>1.6/<target>1.7/' \
      "$pkgname-$pkgname-$pkgver/pom.xml"
}

build() {
  cd "$pkgname-$pkgname-$pkgver"
  mvn package
}

package() {
  install -Dm644 "$pkgname-$pkgname-$pkgver/target/$pkgname-$pkgver-jar-with-dependencies.jar" \
      "$pkgdir/usr/share/java/$pkgname/$pkgname.jar"
  install -Dm755 titokone.sh "$pkgdir/usr/bin/titokone"
}
