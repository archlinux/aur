# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Kalidarn

pkgname=freeradius-client
pkgver=1.1.7
pkgrel=1
pkgdesc="FreeRADIUS Client Software"
arch=('x86_64')
url="http://wiki.freeradius.org/Radiusclient"
license=('BSD')
depends=('sh')
#source=(ftp://ftp.freeradius.org/pub/radius/$pkgname-$pkgver.tar.bz2)
source=($pkgname-$pkgver.tar.gz::https://github.com/FreeRADIUS/freeradius-client/archive/release_${pkgver//./_}.tar.gz)
md5sums=('caba9b9a0c15cfb7f204273f30fc83c3')

build() {
  cd "$srcdir"/freeradius-client-release_${pkgver//./_}
  ./configure --prefix=/usr --sysconfdir=/etc --sbindir=/usr/bin
  make
}

package() {
  cd "$srcdir"/freeradius-client-release_${pkgver//./_}
  make DESTDIR="$pkgdir" install
  install -D -m0644 COPYRIGHT "$pkgdir"/usr/share/licenses/$pkgname/license
  mv "$pkgdir"/etc/radiusclient "$pkgdir"/etc/radiusclient.default
}
