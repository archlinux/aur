# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=igb
pkgver=5.3.5.39
pkgrel=2
pkgdesc="Driver for Intel ethernet network connection"
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/e1000/files/igb%20stable/"
license=('GPL')
depends=('linux>=2.6.30')
makedepends=('linux-headers>=2.6.30' 'xz')
source=("$pkgname-$pkgver-src.tar.gz::https://downloads.sourceforge.net/project/e1000/igb%20stable/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('47e9f9b95d1f7c86351826f6dc9ecc5445a3d8cedfce5691d38327109bdaf0bd')


build() {
  cd "$srcdir/$pkgname-$pkgver/src"

  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver/src"

  _kernver="$(</usr/src/linux/version)"

  find './' -name '*.ko' -exec xz -0 --force {} \;
  install -Dm644 "igb.ko.xz" -t "$pkgdir/usr/lib/modules/$_kernver/updates"
}
