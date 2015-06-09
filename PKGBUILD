# Maintainer: Marcos Heredia <chelqo@gmail.com>

pkgname=gauge
pkgver=2.0.6
pkgrel=1
pkgdesc="Cairo Gauge to display values read from your PC"
arch=('i686' 'x86_64')
url="http://tzclock.org/"
license="GPL"
depends=('libgnomeui' 'cairo' 'gtk3' 'libgweather' 'lm_sensors')
makedepends=('pkg-config' 'desktop-file-utils')
conflicts=("$pkgname-gtk2")
source=("http://tzclock.org/releases/source/${pkgname}-${pkgver}.tar.bz2")
md5sums=('119bd01ee0f0b6660ef92dd94b5b0576')
DLAGENTS=("http::/usr/bin/wget --passive-ftp -c -O %o %u") # curl: (22) The requested URL returned error: 406 Not Acceptable

build() {
  cd $srcdir/$pkgname-$pkgver/
  ./configure --prefix=/usr || return 1
  make || return 1
}

package() {
  cd $srcdir/$pkgname-$pkgver/
  make DESTDIR=${pkgdir} install || return 1

  install -dm755 $pkgdir/usr/share/licenses/$pkgname/
  install -Dpm644 COPYING $pkgdir/usr/share/licenses/$pkgname/

  install -dm755 $pkgdir/usr/share/doc/$pkgname/
  install -Dpm644 AUTHORS ChangeLog INSTALL NEWS README debian/control $pkgdir/usr/share/doc/$pkgname/

  echo "Comment[es]=Monitores del sistema en un dial" >>$pkgdir/usr/share/applications/Gauge.desktop
}
