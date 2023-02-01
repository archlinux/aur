# Maintainer: Artjom Simon <hello@artjomsimon.berlin>
# Contributor: William Di Luigi <williamdiluigi@gmail.com>

pkgname=flyway
pkgver=9.14.0
pkgrel=1
pkgdesc="Database migration utility written Java, supporting a wide range of databases"
arch=('any')
url="https://flywaydb.org/"
license=('Apache')
depends=('java-environment>=8')
source=(https://repo1.maven.org/maven2/org/flywaydb/flyway-commandline/$pkgver/flyway-commandline-$pkgver.tar.gz)
sha512sums=('39657a9fecf9cd2d53eef01875a55420524a4ce3a07b417b3789f36bc44c077bc8ddacb7ab997f31b83f4047eab2e9428506076cf438e9ce5051e781f3ae3b34')

package() {
  cd $srcdir

  install -d -m755 $pkgdir/opt/$pkgname
  cp -r $pkgname-$pkgver $pkgdir/opt/$pkgname
  install -d -m755 $pkgdir/usr/bin

  cat << 'EOF' > $pkgdir/usr/bin/flyway
#!/bin/sh
"$JAVA_HOME/bin/java" -Djava.security.egd=file:/dev/../dev/urandom -cp /opt/flyway/flyway-9.14.0/lib/*:/opt/flyway/flyway-9.14.0/lib/aad/*:/opt/flyway/flyway-9.14.0/lib/oracle_wallet/*:/opt/flyway/flyway-9.14.0/lib/community/*:/opt/flyway/flyway-9.14.0/drivers/*:/opt/flyway/flyway-9.14.0/drivers/gcp* org.flywaydb.commandline.Main "$@"
EOF
  chmod 755 $pkgdir/usr/bin/flyway
}

# vim:set ts=2 sw=2 et:
