# Maintainer: Guillaume ALAUX <guillaume@archlinux.org>
# Contributor: Jaroslaw Swierczynski <swiergot@aur.archlinux.org>

pkgname=javasqlite
pkgver=20150419
pkgrel=2
pkgdesc='Java wrapper including a basic JDBC driver for the SQLite 2/3 database engine'
arch=('x86_64')
url="http://www.ch-werner.de/javasqlite/"
license=('custom:BSD-style')
depends=('java-runtime' 'sqlite')
makedepends=('java-environment=7')
source=(http://www.ch-werner.de/$pkgname/$pkgname-$pkgver.tar.gz)
sha256sums=('b6b26e2c1a2174f5525d904eb3ff698c3f7089f0d4b4c84cf6121da08c8d801f')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  export JAVA_HOME=/usr/lib/jvm/java-7-openjdk
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  _javadir='/usr/share/java'
  make \
    DESTDIR="$pkgdir" \
    JAR_DIR=$_javadir \
    install
  install -D -m 644 license.terms "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  cd $pkgdir$_javadir
  mv sqlite.jar sqlite-$pkgver.jar
  ln -s sqlite-$pkgver.jar sqlite.jar
}
