# Maintainer: Artjom Simon <hello@artjomsimon.berlin>
# Contributor: William Di Luigi <williamdiluigi@gmail.com>

pkgname=flyway
pkgver=10.1.0
pkgrel=1
pkgdesc="Database migration utility written Java, supporting a wide range of databases"
arch=('any')
url="https://flywaydb.org/"
license=('Apache')
depends=('java-environment>=17')
source=(https://repo1.maven.org/maven2/org/flywaydb/flyway-commandline/$pkgver/flyway-commandline-$pkgver.tar.gz)
sha512sums=('79b76f487209476e06b2009b6e5a10446c633b62f02ec8e765db4fb77bfb986aed333d5310a83af2e112a4782e92e0b1b1377cecff0e5450f25b0ed74e7403eb')

package() {
  cd $srcdir

  install -d -m755 $pkgdir/opt/$pkgname
  cp -r $pkgname-$pkgver $pkgdir/opt/$pkgname
  install -d -m755 $pkgdir/usr/bin

  cat << 'EOF' > $pkgdir/usr/bin/flyway
#!/bin/sh
"$JAVA_HOME/bin/java" -Djava.security.egd=file:/dev/../dev/urandom -cp /opt/flyway/flyway-10.1.0/lib/*:/opt/flyway/flyway-10.1.0/lib/aad/*:/opt/flyway/flyway-10.1.0/lib/oracle_wallet/*:/opt/flyway/flyway-10.1.0/lib/flyway/*:/opt/flyway/flyway-10.1.0/drivers/*:/opt/flyway/flyway-10.1.0/drivers/gcp* org.flywaydb.commandline.Main "$@"
EOF
  chmod 755 $pkgdir/usr/bin/flyway
}

# vim:set ts=2 sw=2 et:
