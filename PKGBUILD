# Maintainer: Marcos Heredia <chelqo@gmail.com>

pkgname=gauge
pkgver=2.1.7
pkgrel=1
pkgdesc="Cairo Gauge to display values read from your PC"
arch=('i686' 'x86_64')
url="http://tzclock.org/"
license=("GPL")
depends=('gtk3' 'lm_sensors' 'curl')
makedepends=('pkg-config' 'desktop-file-utils')
conflicts=("$pkgname-gtk2")
source=("https://theknight.co.uk/releases/source/${pkgname}-${pkgver}.tar.bz2")
md5sums=('140fd1f9f180e4e802867586021211d8')
DLAGENTS=("https::/usr/bin/wget --passive-ftp -c -O %o %u")

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

  echo "Comment[es]=Monitores del sistema en un dial" >>$pkgdir/usr/share/applications/gauge.desktop
}
