# Contributor: William Di Luigi <williamdiluigi@gmail.com>
# Contributor: Artjom Simon <artjom.simon@gmail.com>

pkgname=flyway
pkgver=5.2.0
pkgrel=1
pkgdesc="Flyway Community Edition - Database Migrations Made Easy."
arch=('any')
url="https://flywaydb.org/"
license=('Apache')
depends=('java-environment>=8')
source=(https://repo1.maven.org/maven2/org/flywaydb/flyway-commandline/$pkgver/flyway-commandline-$pkgver.tar.gz)
sha256sums=('b2e585670bcb0b227df008cbc7846f966d3c3aa32c5badbf25fffba106bcd587')

package() {
  cd $srcdir

  install -d -m755 $pkgdir/opt/$pkgname
  cp -r $pkgname-$pkgver $pkgdir/opt/$pkgname
  install -d -m755 $pkgdir/usr/bin

  cat << 'EOF' > $pkgdir/usr/bin/flyway
#!/bin/sh
"$JAVA_HOME/bin/java" -cp /opt/flyway/flyway-5.2.0/lib/community/flyway-core-5.2.0.jar:/opt/flyway/flyway-5.2.0/lib/community/flyway-commandline-5.2.0.jar org.flywaydb.commandline.Main "$@"
EOF
  chmod 755 $pkgdir/usr/bin/flyway
}

# vim:set ts=2 sw=2 et:
