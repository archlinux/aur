# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=igb
pkgver=5.4.6
pkgrel=1
pkgdesc="Driver for Intel ethernet network connection"
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/e1000/files/igb%20stable/"
license=('GPL')
depends=('linux>=2.6.30')
makedepends=('linux-headers>=2.6.30' 'xz')
source=("$pkgname-$pkgver-src.tar.gz::https://downloads.sourceforge.net/project/e1000/igb%20stable/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('18a12e6fb9e7719b28aec14f0bbe2f7093823f7bb2c47b3c622f1ad2baa861dd')


build() {
  cd "$srcdir/$pkgname-$pkgver"

  make -C "src"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  _kernver="$(< /usr/src/linux/version)"

  find 'src/' -name '*.ko' -exec xz -0 --force {} \;
  install -Dm644 "src/igb.ko.xz" -t "$pkgdir/usr/lib/modules/$_kernver/updates"
}
