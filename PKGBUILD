# Maintainer: Matthieu Rakotojaona <matthieu.rakotojaona@gmail.com>

pkgname=paclan
pkgver=0.1.2
pkgrel=1
epoch=
pkgdesc='Share pacman packages on the LAN. A replacement for pacserve'
arch=('i686' 'x86_64')
url='https://github.com/rakoo/paclan'
license=('CC0')
groups=()
makedepends=('go')
source=("https://github.com/rakoo/paclan/archive/v${pkgver}.zip")
sha256sums=(29efca936520d4e8458ffbc758cdbb7992e944a7a7dbcfccce54c13229a8c997)
install=paclan.install

build() {
  cd "$srcdir/$pkgname-$pkgver"
  go build -o paclan
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  # systemctl service file
  install -D -m644  'paclan.service' "$pkgdir/usr/lib/systemd/system/paclan.service"

  # paclan binary
  install -D -m755 'paclan' "$pkgdir/usr/bin/$pkgname"

  # paclan.conf
  install -D -m644 'paclan.conf' "$pkgdir/etc/pacman.d/paclan.conf"

  # license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
