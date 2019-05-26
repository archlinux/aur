# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=igb
pkgver=5.3.5.22s
pkgrel=1
pkgdesc="Driver for Intel ethernet network connection"
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/e1000/files/igb%20stable/"
license=('GPL')
depends=('linux>=2.6.30')
makedepends=('linux-headers>=2.6.30' 'xz')
source=("$pkgname-$pkgver-src.tar.gz::https://downloads.sourceforge.net/project/e1000/igb%20stable/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('f20e037412baec27f75ec387244b9069e94393c936bb905a4db4cb78f98e081c')


build() {
  cd "$srcdir/$pkgname-$pkgver/src"

  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver/src"

  _updates="/usr/lib/modules/$(uname -r)/updates"

  find './' -name '*.ko' -exec xz -0 --force {} \;
  install -Dm644 'igb.ko.xz' "$pkgdir/$_updates/igb.ko.xz"
}
