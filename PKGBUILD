# Maintainer: Artjom Simon <hello@artjomsimon.berlin>
# Contributor: William Di Luigi <williamdiluigi@gmail.com>

pkgname=flyway
pkgver=9.15.2
pkgrel=1
pkgdesc="Database migration utility written Java, supporting a wide range of databases"
arch=('any')
url="https://flywaydb.org/"
license=('Apache')
depends=('java-environment>=8')
source=(https://repo1.maven.org/maven2/org/flywaydb/flyway-commandline/$pkgver/flyway-commandline-$pkgver.tar.gz)
sha512sums=('68ce6848f1bcdbca7ef6de1135873427522398530d58142def441bd679f28bb77716e654c066512831107d3ab8c0dd85f2e55be55bdab17cd4f40e26e1560191')

package() {
  cd $srcdir

  install -d -m755 $pkgdir/opt/$pkgname
  cp -r $pkgname-$pkgver $pkgdir/opt/$pkgname
  install -d -m755 $pkgdir/usr/bin

  cat << 'EOF' > $pkgdir/usr/bin/flyway
#!/bin/sh
"$JAVA_HOME/bin/java" -Djava.security.egd=file:/dev/../dev/urandom -cp /opt/flyway/flyway-9.15.2/lib/*:/opt/flyway/flyway-9.15.2/lib/aad/*:/opt/flyway/flyway-9.15.2/lib/oracle_wallet/*:/opt/flyway/flyway-9.15.2/lib/community/*:/opt/flyway/flyway-9.15.2/drivers/*:/opt/flyway/flyway-9.15.2/drivers/gcp* org.flywaydb.commandline.Main "$@"
EOF
  chmod 755 $pkgdir/usr/bin/flyway
}

# vim:set ts=2 sw=2 et:
