# Contributor: William Di Luigi <williamdiluigi@gmail.com>

pkgname=flyway
pkgver=4.0
pkgrel=1
pkgdesc="Flyway - Database Migrations Made Easy."
arch=('any')
url="https://flywaydb.org/"
license=('Apache')
depends=('java-environment>=8')
source=(https://repo1.maven.org/maven2/org/flywaydb/flyway-commandline/$pkgver/flyway-commandline-$pkgver.tar.gz)
sha256sums=('218a7f6b3ac629f084e417bbaecd06ad9723704832aa72a81c6e096ac55aacd4')

package() {
  cd $srcdir

  install -d -m755 $pkgdir/opt/$pkgname
  cp -r $pkgname-$pkgver $pkgdir/opt/$pkgname
  install -d -m755 $pkgdir/usr/bin

  cat << 'EOF' > $pkgdir/usr/bin/flyway
#!/bin/sh
"$JAVA_HOME/bin/java" -cp /opt/flyway/flyway-4.0/lib/flyway-core-4.0.jar:/opt/flyway/flyway-4.0/lib/flyway-commandline-4.0.jar org.flywaydb.commandline.Main $@
EOF
  chmod 755 $pkgdir/usr/bin/flyway
}

# vim:set ts=2 sw=2 et:
