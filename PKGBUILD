# Maintainer: Artjom Simon <hello@artjomsimon.berlin>
# Contributor: William Di Luigi <williamdiluigi@gmail.com>

pkgname=flyway
pkgver=9.20.0
pkgrel=1
pkgdesc="Database migration utility written Java, supporting a wide range of databases"
arch=('any')
url="https://flywaydb.org/"
license=('Apache')
depends=('java-environment>=8')
source=(https://repo1.maven.org/maven2/org/flywaydb/flyway-commandline/$pkgver/flyway-commandline-$pkgver.tar.gz)
sha512sums=('c432997a2215c1c6ba8d5d8d0347a9de0d67131140790300277a5298bcb023909653ab62234924e39fc687eca6705af6334198d7fcc32a33f0a975d041a4d247')

package() {
  cd $srcdir

  install -d -m755 $pkgdir/opt/$pkgname
  cp -r $pkgname-$pkgver $pkgdir/opt/$pkgname
  install -d -m755 $pkgdir/usr/bin

  cat << 'EOF' > $pkgdir/usr/bin/flyway
#!/bin/sh
"$JAVA_HOME/bin/java" -Djava.security.egd=file:/dev/../dev/urandom -cp /opt/flyway/flyway-9.20.0/lib/*:/opt/flyway/flyway-9.20.0/lib/aad/*:/opt/flyway/flyway-9.20.0/lib/oracle_wallet/*:/opt/flyway/flyway-9.20.0/lib/community/*:/opt/flyway/flyway-9.20.0/drivers/*:/opt/flyway/flyway-9.20.0/drivers/gcp* org.flywaydb.commandline.Main "$@"
EOF
  chmod 755 $pkgdir/usr/bin/flyway
}

# vim:set ts=2 sw=2 et:
