# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=igb
pkgver=5.3.5.18
pkgrel=2
pkgdesc="Driver for Intel ethernet network connection"
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/e1000/files/igb%20stable/"
license=('GPL')
depends=('linux>=2.6.30')
makedepends=('linux-headers>=2.6.30')
source=("$pkgname-$pkgver-src.tar.gz::https://downloads.sourceforge.net/project/e1000/igb%20stable/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('aee529b48ced4f1de24600240636e3d3bbafbe13401418232fef259f3ee4e19c')


prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  #patch -p1 -i "$srcdir/pci_enable_msix.patch"
}

build() {
  cd "$srcdir/$pkgname-$pkgver/src"

  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver/src"

  _updates="/usr/lib/modules/$(uname -r)/updates"

  find './' -name '*.ko' -exec gzip --force --fast {} \;
  install -Dm644 'igb.ko.gz' "$pkgdir/$_updates/igb.ko.gz"
}
