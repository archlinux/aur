# Maintainer: jose <jose1711 [at] gmail (dot) com>

pkgname=logsend
pkgver=1.0
pkgrel=1
pkgdesc="tool for sending e-mail notifications about changes in (log) files"
arch=('any')
url="http://logsend.sourceforge.net"
license=('GPL')
depends=('bash' 'inotify-tools')
source=("http://downloads.sourceforge.net/logsend/${pkgname}-${pkgver}.tar.gz")
md5sums=('e6de052161c3d553391f99620027a33b')

build() {
sed -i 's/DESTDIR="${prefix}\/${ORV_PKG_NAME}"/DESTDIR="${prefix}"\/usr/' $srcdir/$pkgname-$pkgver/install.sh
}

package() {
cd $srcdir/$pkgname-$pkgver
prefix=$pkgdir/ make install
find $pkgdir/ -exec chown root '{}' \;
sed -i '/^DESTDIR=/s/.*/DESTDIR="\/usr"/' $pkgdir/usr/bin/logsend
sed -i 's/\$"\([57]\)"/$\1/' $pkgdir/usr/lib/logsend-1.0/logsend-config
}
