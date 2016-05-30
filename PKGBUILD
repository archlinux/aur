# Maintainer: Carsten Feuls <archlinux@carstenfeuls.de>

pkgname=pg_top
pkgver=3.7.0
pkgrel=2
pkgdesc='top-like app for monitoring PostgreSQL backends (previously known as ptop)'
arch=('i686' 'x86_64' 'armv5h' 'armv6h' 'armv7h')
license=('BSD')  # original BSD license
url='http://ptop.projects.postgresql.org/'
depends=('postgresql-libs')
source=("http://pgfoundry.org/frs/download.php/3504/$pkgname-$pkgver.tar.bz2")

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  LDFLAGS="-lncurses $LDFLAGS"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
  install -d -m755 "${pkgdir}/usr/share/doc/${pkgname}/"
  install -D -m644 README HISTORY FAQ "${pkgdir}/usr/share/doc/${pkgname}/"
}
sha512sums=('509cd3ce65a9b549097eaab5ae27106fa469cdeb4f37950564654f3df01390e1a771c8fa4f5858c3e4c1e76470b6c0fd9b07e8268564f59285e30bf824d7c4ec')
