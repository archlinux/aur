# Maintainer: Mathieu OTHACEHE <m.othacehe@gmail.com>
# Contributor: Mathieu OTHACEHE <m.othacehe@gmail.com>
# Contributor: Brenton <brenton@taylorbyte.com>
# Contributor: Daniel Menelkir <menelkir at itroll dot org>

pkgname=g15stats
pkgver=3.0
pkgrel=1
pkgdesc="A CPU/Mem/Swap/Network monitoring client for G15Daemon."
arch=('i686' 'x86_64')
url="https://gitlab.com/menelkir/g15stats"
license=('GPL')
depends=('g15daemon' 'libgtop' 'libg15' 'libg15render')
source=(https://gitlab.com/menelkir/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.bz2)
sha512sums=('8641f1df6910c244be9e695c6f4976e15dbaddc92a641ffbce1f75ef440c94e7a9424bf678d43e2c0cc3241ebf8e03a2fc1c78042746cb60dee2b68e312a2b7d')

build() {
  cd $pkgname-$pkgver
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
