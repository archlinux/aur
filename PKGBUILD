# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=igb
pkgver=5.3.6
pkgrel=1
pkgdesc="Driver for Intel ethernet network connection"
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/e1000/files/igb%20stable/"
license=('GPL')
depends=('linux>=2.6.30')
makedepends=('linux-headers>=2.6.30' 'xz')
source=("$pkgname-$pkgver-src.tar.gz::https://downloads.sourceforge.net/project/e1000/igb%20stable/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('478064f5ea272ee7043e01d8e4db92dabcdf443fd398c37d87af24eaa86d501a')


build() {
  cd "$srcdir/$pkgname-$pkgver/src"

  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver/src"

  _kernver="$(< /usr/src/linux/version)"

  find './' -name '*.ko' -exec xz -0 --force {} \;
  install -Dm644 "igb.ko.xz" -t "$pkgdir/usr/lib/modules/$_kernver/updates"
}
