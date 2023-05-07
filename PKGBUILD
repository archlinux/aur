# Maintainer: Artjom Simon <hello@artjomsimon.berlin>
# Contributor: William Di Luigi <williamdiluigi@gmail.com>

pkgname=flyway
pkgver=9.17.0
pkgrel=1
pkgdesc="Database migration utility written Java, supporting a wide range of databases"
arch=('any')
url="https://flywaydb.org/"
license=('Apache')
depends=('java-environment>=8')
source=(https://repo1.maven.org/maven2/org/flywaydb/flyway-commandline/$pkgver/flyway-commandline-$pkgver.tar.gz)
sha512sums=('b096ff31f5ef796147e9e38eff252e41ca2ddbcb55163a8f98f43d3d364423e9d6af2c69c36be5e461a9a8f8ca13fa8679096e91310125d3b460ebd24e4e6756')

package() {
  cd $srcdir

  install -d -m755 $pkgdir/opt/$pkgname
  cp -r $pkgname-$pkgver $pkgdir/opt/$pkgname
  install -d -m755 $pkgdir/usr/bin

  cat << 'EOF' > $pkgdir/usr/bin/flyway
#!/bin/sh
"$JAVA_HOME/bin/java" -Djava.security.egd=file:/dev/../dev/urandom -cp /opt/flyway/flyway-9.17.0/lib/*:/opt/flyway/flyway-9.17.0/lib/aad/*:/opt/flyway/flyway-9.17.0/lib/oracle_wallet/*:/opt/flyway/flyway-9.17.0/lib/community/*:/opt/flyway/flyway-9.17.0/drivers/*:/opt/flyway/flyway-9.17.0/drivers/gcp* org.flywaydb.commandline.Main "$@"
EOF
  chmod 755 $pkgdir/usr/bin/flyway
}

# vim:set ts=2 sw=2 et:
