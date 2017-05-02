# Contributor: William Di Luigi <williamdiluigi@gmail.com>

pkgname=flyway
pkgver=4.2.0
pkgrel=1
pkgdesc="Flyway - Database Migrations Made Easy."
arch=('any')
url="https://flywaydb.org/"
license=('Apache')
depends=('java-environment>=8')
source=(https://repo1.maven.org/maven2/org/flywaydb/flyway-commandline/$pkgver/flyway-commandline-$pkgver.tar.gz)
sha256sums=('c198497cdbad6eaec052cf7db1999c7899998e4d0c980bcad757998e8139b2bb')

package() {
  cd $srcdir

  install -d -m755 $pkgdir/opt/$pkgname
  cp -r $pkgname-$pkgver $pkgdir/opt/$pkgname
  install -d -m755 $pkgdir/usr/bin

  cat << 'EOF' > $pkgdir/usr/bin/flyway
#!/bin/sh
"$JAVA_HOME/bin/java" -cp /opt/flyway/flyway-4.2.0/lib/flyway-core-4.2.0.jar:/opt/flyway/flyway-4.2.0/lib/flyway-commandline-4.2.0.jar org.flywaydb.commandline.Main "$@"
EOF
  chmod 755 $pkgdir/usr/bin/flyway
}

# vim:set ts=2 sw=2 et:
