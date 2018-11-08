# Contributor: William Di Luigi <williamdiluigi@gmail.com>
# Contributor: Artjom Simon <artjom.simon@gmail.com>

pkgname=flyway
pkgver=5.2.1
pkgrel=1
pkgdesc="Flyway Community Edition - Database Migrations Made Easy."
arch=('any')
url="https://flywaydb.org/"
license=('Apache')
depends=('java-environment>=8')
source=(https://repo1.maven.org/maven2/org/flywaydb/flyway-commandline/$pkgver/flyway-commandline-$pkgver.tar.gz)
sha256sums=('3ac463a17583c3479de2eee377c2a48e739b527c87b4168426125fc4b019a552')

package() {
  cd $srcdir

  install -d -m755 $pkgdir/opt/$pkgname
  cp -r $pkgname-$pkgver $pkgdir/opt/$pkgname
  install -d -m755 $pkgdir/usr/bin

  cat << 'EOF' > $pkgdir/usr/bin/flyway
#!/bin/sh
"$JAVA_HOME/bin/java" -cp /opt/flyway/flyway-5.2.1/lib/community/flyway-core-5.2.1.jar:/opt/flyway/flyway-5.2.1/lib/community/flyway-commandline-5.2.1.jar org.flywaydb.commandline.Main "$@"
EOF
  chmod 755 $pkgdir/usr/bin/flyway
}

# vim:set ts=2 sw=2 et:
