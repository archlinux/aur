# Maintainer: jose <jose1711 [at] gmail (dot) com>

pkgname=logsend
pkgver=1.0
pkgrel=2
pkgdesc="tool for sending e-mail notifications about changes in (log) files"
arch=('any')
url="https://github.com/jose1711/logsend"
license=('GPL')
depends=('bash' 'inotify-tools')
source=("http://downloads.sourceforge.net/logsend/${pkgname}-${pkgver}.tar.gz")
source=("https://github.com/jose1711/logsend/archive/refs/tags/${pkgver}.tar.gz")
md5sums=('17e628d3265d8d15177fc97a9863b474')

build() {
  sed -i 's/DESTDIR="${prefix}\/${ORV_PKG_NAME}"/DESTDIR="${prefix}"\/usr/' $srcdir/$pkgname-$pkgver/install.sh
}

package() {
  cd $srcdir/$pkgname-$pkgver
  prefix=$pkgdir/ make install
  find $pkgdir/ -exec chown root '{}' \;
  sed -i '/^DESTDIR=/s/.*/DESTDIR="\/usr"/' $pkgdir/usr/bin/logsend
  sed -i 's/\$"\([57]\)"/$\1/' $pkgdir/usr/lib/logsend-${pkgver}/logsend-config
}
