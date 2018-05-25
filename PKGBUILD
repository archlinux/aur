# Maintainer: Chanathip Srithanrat <axesd9@gmail.com>

pkgname=sbt-latest
_pkgname=${pkgname%-*}
pkgver=1.1.5
pkgrel=1
pkgdesc='A build tool for Scala, Java, and more'
arch=('any')
url='http://www.scala-sbt.org/'
license=('BSD')
depends=('java-runtime-headless=8'
         'rsync'
         'sh')
conflicts=('sbt')
source=("https://piccolo.link/sbt-$pkgver.tgz"
        "https://raw.githubusercontent.com/$_pkgname/$_pkgname/v$pkgver/LICENSE")
md5sums=('b771480feb07f98fa8cd6d787c8d4485'
         '0e89a4beba6e141a9a26714e89d12fdf')

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
