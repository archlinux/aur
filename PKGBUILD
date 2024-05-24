# Maintainer: Freya Murphy <contact@freyacat.org>
pkgname=crab
pkgver=0.0.6
pkgrel=1
pkgdesc="A rusty permission authentication system"
arch=('x86_64' 'i686')
url="https://g.freya.cat/freya/crab"
license=('GPL3')
makedepends=('cargo')
depends=('glibc' 'pam')
source=("$pkgname-$pkgver.tar.gz::https://f.freya.cat/source/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('SKIP')

build() {
  cd "$srcdir"
  cargo build --release
}

package() {
  cd "$srcdir"
  install -D --mode=4755 --owner=root --group=root ./target/release/crab ${pkgdir}/usr/bin/crab
  install -D --mode=600 --owner=root --group=root ./config/pam ${pkgdir}/etc/pam.d/crab
  install -D --mode=644 --owner=root --group=root ./config/default ${pkgdir}/usr/share/crab/crab.conf
}
