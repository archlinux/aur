# Maintainer: Artjom Simon <hello@artjomsimon.berlin>
# Contributor: William Di Luigi <williamdiluigi@gmail.com>

pkgname=flyway
pkgver=9.22.3
pkgrel=1
pkgdesc="Database migration utility written Java, supporting a wide range of databases"
arch=('any')
url="https://flywaydb.org/"
license=('Apache')
depends=('java-environment>=8')
source=(https://repo1.maven.org/maven2/org/flywaydb/flyway-commandline/$pkgver/flyway-commandline-$pkgver.tar.gz)
sha512sums=('198b7d33b2501ee77383887b367fae3b89458e597497180cc81819b17eab8c43620f4e08ee1c4b7d1c4b3cfb07036c781576f89f17b009426ccb61f949f20443')

package() {
  cd $srcdir

  install -d -m755 $pkgdir/opt/$pkgname
  cp -r $pkgname-$pkgver $pkgdir/opt/$pkgname
  install -d -m755 $pkgdir/usr/bin

  cat << 'EOF' > $pkgdir/usr/bin/flyway
#!/bin/sh
"$JAVA_HOME/bin/java" -Djava.security.egd=file:/dev/../dev/urandom -cp /opt/flyway/flyway-9.22.3/lib/*:/opt/flyway/flyway-9.22.3/lib/aad/*:/opt/flyway/flyway-9.22.3/lib/oracle_wallet/*:/opt/flyway/flyway-9.22.3/lib/community/*:/opt/flyway/flyway-9.22.3/drivers/*:/opt/flyway/flyway-9.22.3/drivers/gcp* org.flywaydb.commandline.Main "$@"
EOF
  chmod 755 $pkgdir/usr/bin/flyway
}

# vim:set ts=2 sw=2 et:
