# Maintainer: Mathieu OTHACEHE <m.othacehe@gmail.com>
# Contributor: Mathieu OTHACEHE <m.othacehe@gmail.com>
# Contributor: Brenton <brenton@taylorbyte.com>
# Contributor: Daniel Menelkir <menelkir at itroll dot org>

pkgname=g15stats
pkgver=1.9.8
pkgrel=1
pkgdesc="A CPU/Mem/Swap/Network monitoring client for G15Daemon."
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/g15daemon/"
license=('GPL')
depends=('g15daemon' 'libgtop' 'libg15' 'libg15render')
source=(https://gitlab.com/menelkir/$pkgname/-/archive/v$pkgver/$pkgname-v$pkgver.tar.bz2
	https://gitlab.com/menelkir/$pkgname/-/raw/master/contrib/init/$pkgname.service)
sha256sums=('52b6517fad2ddc721958490b286c3018ed12a40f52f61ec38d8ab7065eb8caf8'
	  '3110c25367cc75529af76ca9ca6e32a6bda731c57dd145002aab6b853281bccd')

build() {
  cd $pkgname-v$pkgver
  ./autogen.sh
  ./configure --prefix=/usr \
              --sysconfdir=/etc \
              --localstatedir=/var
  make
}

package() {
  cd $pkgname-v$pkgver
  make DESTDIR="$pkgdir" install
  install -D -m 644 "${srcdir}/g15stats.service" \
                    "${pkgdir}/usr/lib/systemd/system/g15stats.service"
}
