# Maintainer: Artjom Simon <hello@artjomsimon.berlin>
# Contributor: William Di Luigi <williamdiluigi@gmail.com>

pkgname=flyway
pkgver=9.16.1
pkgrel=1
pkgdesc="Database migration utility written Java, supporting a wide range of databases"
arch=('any')
url="https://flywaydb.org/"
license=('Apache')
depends=('java-environment>=8')
source=(https://repo1.maven.org/maven2/org/flywaydb/flyway-commandline/$pkgver/flyway-commandline-$pkgver.tar.gz)
sha512sums=('2c4c02030aa9dccd9ddc825045d965a70d492f8b2f342f7c1c191802a09db9113848120e39b98a8ce6cc0115f4cec452e951182bbc1dd0f2e732b3ae1fded7a1')

package() {
  cd $srcdir

  install -d -m755 $pkgdir/opt/$pkgname
  cp -r $pkgname-$pkgver $pkgdir/opt/$pkgname
  install -d -m755 $pkgdir/usr/bin

  cat << 'EOF' > $pkgdir/usr/bin/flyway
#!/bin/sh
"$JAVA_HOME/bin/java" -Djava.security.egd=file:/dev/../dev/urandom -cp /opt/flyway/flyway-9.16.1/lib/*:/opt/flyway/flyway-9.16.1/lib/aad/*:/opt/flyway/flyway-9.16.1/lib/oracle_wallet/*:/opt/flyway/flyway-9.16.1/lib/community/*:/opt/flyway/flyway-9.16.1/drivers/*:/opt/flyway/flyway-9.16.1/drivers/gcp* org.flywaydb.commandline.Main "$@"
EOF
  chmod 755 $pkgdir/usr/bin/flyway
}

# vim:set ts=2 sw=2 et:
