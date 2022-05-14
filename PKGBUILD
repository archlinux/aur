# Maintainer: Daniel Menelkir <dmenelkir at gmail dot com>
# Contributor: Mathieu OTHACEHE <m.othacehe@gmail.com>
# Contributor: Brenton <brenton@taylorbyte.com>
# Contributor: Daniel Menelkir <menelkir at itroll dot org>

pkgname=g15stats
pkgver=3.0.3
pkgrel=2
pkgdesc="A CPU/Mem/Swap/Network monitoring client for G15Daemon."
arch=('i686' 'x86_64')
url="https://gitlab.com/menelkir/g15stats"
license=('GPL')
depends=('g15daemon' 'libgtop' 'libg15' 'libg15render')
source=(https://gitlab.com/menelkir/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.bz2)
sha512sums=('6034fec8f2188182c6fd7587ec5f5ef8d06b617875573382385edc12f1aefb3b9bf52b437eafb7c9412676c5ceae42ae8c9c2099270908aea2b949d01df79047')

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
  echo ""
  echo "This package doesn't come with an init, you should install one:"
  echo "g15stats-runit"
  echo "g15stats-openrc"
  echo "g15stats-systemd"
}
