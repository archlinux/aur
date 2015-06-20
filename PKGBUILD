# Maintainer: Sandor Nagy <sanya868 at gmail dot com>
# Contributor: Humberto F. da Luz Jr. <hfluz at uel dot br>
# Contributor: Zhuo Peng <zhuo dot peng at vanemy dot org>
pkgname=archiva
pkgver=2.2.0
pkgrel=1
pkgdesc="Apache Archiva™ is an extensible repository management software that helps taking care of your own personal or enterprise-wide build artifact repository"
arch=("any")
url="http://archiva.apache.org/"
license=("Apache")
depends=("java-runtime")
source=("http://www.us.apache.org/dist/archiva/$pkgver/binaries/apache-archiva-$pkgver-bin.tar.gz"
        "archiva.service")
md5sums=('03485b14a303cefb4537b641b8143778'
         'd741d8899541001f6ab062b2772428e4')

package() {
  cd "$srcdir"
  sed -i 's/8080/8081/' apache-archiva-$pkgver/conf/jetty.xml
  mkdir -p "$pkgdir/usr/share/java/archiva"
  cp -r apache-archiva-$pkgver/* "$pkgdir/usr/share/java/archiva"
  chmod 444 "$pkgdir/usr/share/java/archiva"
  install -Dm644 archiva.service "$pkgdir/usr/lib/systemd/system/archiva.service"
}
