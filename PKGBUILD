# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=igb
pkgver=5.3.5.22
pkgrel=1
pkgdesc="Driver for Intel ethernet network connection"
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/e1000/files/igb%20stable/"
license=('GPL')
depends=('linux>=2.6.30')
makedepends=('linux-headers>=2.6.30' 'xz')
source=("$pkgname-$pkgver-src.tar.gz::https://downloads.sourceforge.net/project/e1000/igb%20stable/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('16402e7d874bd563c2e8cdee7c9a6daf6d12084e800a84b608a18e87ddc6cef6')


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

  find './' -name '*.ko' -exec xz -0 --force {} \;
  install -Dm644 'igb.ko.xz' "$pkgdir/$_updates/igb.ko.xz"
}
