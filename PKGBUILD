# Contributor: William Di Luigi <williamdiluigi@gmail.com>
# Contributor: Artjom Simon <artjom.simon@gmail.com>

pkgname=flyway
pkgver=5.1.1
pkgrel=1
pkgdesc="Flyway Community Edition - Database Migrations Made Easy."
arch=('any')
url="https://flywaydb.org/"
license=('Apache')
depends=('java-environment>=8')
source=(https://repo1.maven.org/maven2/org/flywaydb/flyway-commandline/$pkgver/flyway-commandline-$pkgver.tar.gz)
sha256sums=('ee2ca6771473d790cf1bbc370de1747d205671d443279b450333529e4b3db14d')

package() {
  cd $srcdir

  install -d -m755 $pkgdir/opt/$pkgname
  cp -r $pkgname-$pkgver $pkgdir/opt/$pkgname
  install -d -m755 $pkgdir/usr/bin

  cat << 'EOF' > $pkgdir/usr/bin/flyway
#!/bin/sh
"$JAVA_HOME/bin/java" -cp /opt/flyway/flyway-5.1.1/lib/flyway-core-5.1.1.jar:/opt/flyway/flyway-5.1.1/lib/flyway-commandline-5.1.1.jar org.flywaydb.commandline.Main "$@"
EOF
  chmod 755 $pkgdir/usr/bin/flyway
}

# vim:set ts=2 sw=2 et:
