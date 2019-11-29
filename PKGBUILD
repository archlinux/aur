# Maintainer: Artjom Simon <artjom.simon@gmail.com>
# Contributor: William Di Luigi <williamdiluigi@gmail.com>

pkgname=flyway
pkgver=6.1.0
pkgrel=1
pkgdesc="Database migration utility written Java, supporting a wide range of databases"
arch=('any')
url="https://flywaydb.org/"
license=('Apache')
depends=('java-environment>=8')
source=(https://repo1.maven.org/maven2/org/flywaydb/flyway-commandline/$pkgver/flyway-commandline-$pkgver.tar.gz)
sha256sums=('efe614d0d1af851f102b96b6db3deca2a89a1d90f427411ac42da138e3dec891')

package() {
  cd $srcdir

  install -d -m755 $pkgdir/opt/$pkgname
  cp -r $pkgname-$pkgver $pkgdir/opt/$pkgname
  install -d -m755 $pkgdir/usr/bin

  cat << 'EOF' > $pkgdir/usr/bin/flyway
#!/bin/sh
"$JAVA_HOME/bin/java" -cp /opt/flyway/flyway-6.1.0/lib/*:/opt/flyway/flyway-6.1.0/lib/community/*:/opt/flyway/flyway-6.1.0/drivers/* org.flywaydb.commandline.Main "$@"
EOF
  chmod 755 $pkgdir/usr/bin/flyway
}

# vim:set ts=2 sw=2 et:
