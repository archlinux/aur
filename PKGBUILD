# Contributor: William Di Luigi <williamdiluigi@gmail.com>

pkgname=flyway
pkgver=3.2.1
pkgrel=1
pkgdesc="Flyway - Database Migrations Made Easy."
arch=('any')
url="https://flywaydb.org/"
license=('Apache')
depends=('java-environment>=8')
source=(http://repo1.maven.org/maven2/org/flywaydb/flyway-commandline/$pkgver/flyway-commandline-$pkgver.tar.gz)
sha256sums=('da942c3b96d89ca221617a720c1945d16dadf142313380a71a825e62821d0a2b')

package() {
  cd $srcdir

  install -d -m755 $pkgdir/opt/$pkgname
  cp -r $pkgname-$pkgver $pkgdir/opt/$pkgname
  install -d -m755 $pkgdir/usr/bin

  cat << 'EOF' > $pkgdir/usr/bin/flyway
#!/bin/sh
"$JAVA_HOME/bin/java" -cp /opt/flyway/flyway-3.2.1/lib/flyway-core-3.2.1.jar:/opt/flyway/flyway-3.2.1/lib/flyway-commandline-3.2.1.jar org.flywaydb.commandline.Main $@
EOF
  chmod 755 $pkgdir/usr/bin/flyway
}

# vim:set ts=2 sw=2 et:
