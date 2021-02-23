# Maintainer: Mathieu OTHACEHE <m.othacehe@gmail.com>
# Contributor: Mathieu OTHACEHE <m.othacehe@gmail.com>
# Contributor: Brenton <brenton@taylorbyte.com>
# Contributor: Daniel Menelkir <menelkir at itroll dot org>

pkgname=g15stats
pkgver=1.9.8
pkgrel=2
pkgdesc="A CPU/Mem/Swap/Network monitoring client for G15Daemon."
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/g15daemon/"
license=('GPL')
depends=('g15daemon' 'libgtop' 'libg15' 'libg15render')
source=(https://gitlab.com/menelkir/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.bz2)
sha512sums=('24c162a54ecc7124dc2326a02bd106a47dec9c843561d443cb60c54325db4c65b2f41c94583727241d5900e7799cb7ffc284df2fe8d2ace8757dc4dbefe7fe5c')

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
  install -D -m 644 "${srcdir}/${pkgname}-${pkgver}/contrib/init/g15stats.service" \
                    "${pkgdir}/usr/lib/systemd/system/g15stats.service"
}
