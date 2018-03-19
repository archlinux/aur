# Maintainer: Chanathip Srithanrat <axesd9@gmail.com>

pkgname=sbt-latest
_pkgname=${pkgname%-*}
pkgver=1.1.1
pkgrel=1
pkgdesc='A build tool for Scala, Java, and more'
arch=('any')
url='http://www.scala-sbt.org/'
license=('BSD')
depends=('java-runtime-headless=8'
         'rsync'
         'sh')
provides=('sbt')
conflicts=('sbt')
source=("https://github.com/sbt/sbt/releases/download/v$pkgver/sbt-$pkgver.tgz"
        "https://raw.githubusercontent.com/$_pkgname/$_pkgname/v$pkgver/LICENSE")
sha256sums=('8a9072155578f06c861be406e7f9fe989b3770d8da4069dd3cb5ad6c6d25c03b'
            '4a63870e342ef614e3ba2d5e1de3fcc5543504df6e96ecafac00f674a7972ab2')

package() {
  install -d $pkgdir/usr/share/$_pkgname
  install -Dm644 -t $pkgdir/usr/share/$_pkgname/bin $_pkgname/bin/sbt-launch.jar
  install -Dm644 -t $pkgdir/usr/share/$_pkgname/bin $_pkgname/bin/sbt-launch-lib.bash
  install -Dm644 -t $pkgdir/usr/share/$_pkgname/bin $_pkgname/bin/java9-rt-export.jar
  install -Dm755 -t $pkgdir/usr/share/$_pkgname/bin $_pkgname/bin/sbt
  cp -r $_pkgname/lib $pkgdir/usr/share/$_pkgname

  install -d $pkgdir/usr/bin
  ln -s /usr/share/$_pkgname/bin/java9-rt-export.jar $pkgdir/usr/bin
  ln -s /usr/share/$_pkgname/bin/sbt $pkgdir/usr/bin

  install -d $pkgdir/etc
  cp -r $_pkgname/conf $pkgdir/etc/$_pkgname
  ln -s /etc/$_pkgname $pkgdir/usr/share/$_pkgname/conf

  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
