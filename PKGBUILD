# Maintainer: Artjom Simon <hello@artjomsimon.berlin>
# Contributor: William Di Luigi <williamdiluigi@gmail.com>

pkgname=flyway
pkgver=9.5.1
pkgrel=1
pkgdesc="Database migration utility written Java, supporting a wide range of databases"
arch=('any')
url="https://flywaydb.org/"
license=('Apache')
depends=('java-environment>=8')
source=(https://repo1.maven.org/maven2/org/flywaydb/flyway-commandline/$pkgver/flyway-commandline-$pkgver.tar.gz)
sha512sums=('2ae9ad120195c1ca600d3c1877c1fc51ab90fd04c34f336ffd0dc307583078f00016024e6a34165536fe08b2adb4d5427565682322396c110628f629395fadf3')

package() {
  cd $srcdir

  install -d -m755 $pkgdir/opt/$pkgname
  cp -r $pkgname-$pkgver $pkgdir/opt/$pkgname
  install -d -m755 $pkgdir/usr/bin

  cat << 'EOF' > $pkgdir/usr/bin/flyway
#!/bin/sh
"$JAVA_HOME/bin/java" -cp /opt/flyway/flyway-9.5.1/lib/*:/opt/flyway/flyway-9.5.1/lib/community/*:/opt/flyway/flyway-9.5.1/drivers/* org.flywaydb.commandline.Main "$@"
EOF
  chmod 755 $pkgdir/usr/bin/flyway
}

# vim:set ts=2 sw=2 et:
