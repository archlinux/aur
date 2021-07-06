# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=igb
pkgver=5.7.2
pkgrel=1
pkgdesc="Driver for Intel ethernet network connection"
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/e1000/files/igb%20stable/"
license=('GPL')
depends=('linux>=2.6.30')
makedepends=('linux-headers>=2.6.30' 'xz')
source=("$pkgname-$pkgver-src.tar.gz::https://downloads.sourceforge.net/project/e1000/igb%20stable/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('a359ee0e34c88c40b7d8a7f6cfa301b01e875b041e7c73eadf52863b4cc61ebe')


build() {
  cd "$pkgname-$pkgver"

  make -C "src"
}

package() {
  cd "$pkgname-$pkgver"

  _kernver="$(< /usr/src/linux/version)"

  find 'src/' -name '*.ko' -exec xz -0 --force {} \;
  install -Dm644 "src/igb.ko.xz" -t "$pkgdir/usr/lib/modules/$_kernver/updates"
}
