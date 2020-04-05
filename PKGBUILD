# Maintainer: Mathieu OTHACEHE <m.othacehe@gmail.com>
# Contributor: Mathieu OTHACEHE <m.othacehe@gmail.com>
# Contributor: Brenton <brenton@taylorbyte.com>

pkgname=g15stats
pkgver=1.9.7
pkgrel=1
pkgdesc="A CPU/Mem/Swap/Network monitoring client for G15Daemon."
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/g15daemon/"
license=('GPL')
depends=('g15daemon' 'libgtop' 'libg15' 'libg15render')
source=(http://sourceforge.net/projects/g15daemon/files/G15Stats/$pkgver/$pkgname-$pkgver.tar.bz2
	g15stats.service)
sha1sums=('4780aac4d32b98b8c7ad7383425093803ca89cf2'
	  'f2e5dfd80d0b6d6ddbafe1fdf1bfe2ae97c3498e')

build() {
  cd $pkgname-$pkgver
  ./autogen.sh
  ./configure --prefix=/usr \
              --sysconfdir=/etc \
              --localstatedir=/var
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  install -D -m 644 "${srcdir}/g15stats.service" \
                    "${pkgdir}/usr/lib/systemd/system/g15stats.service"
}
