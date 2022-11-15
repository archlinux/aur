# Maintainer: Jonathan Steel <jsteel at archlinux.org>
# Contributor: Peter Simons <simons@cryp.to>

pkgname=shhopt
pkgver=1.1.7
pkgrel=6
pkgdesc="Library for parsing command line options"
arch=('x86_64')
url="https://shh.thathost.com/pub-unix"
license=('PerlArtistic')
options=('staticlibs')
source=($url/files/$pkgname-$pkgver.tar.gz)
sha256sums=('bae94335124efa6fcc2f0a55cabd68c9c90be935bcdb8054d7e5188e0d5da679')

build() {
  cd $pkgname-$pkgver

  CFLAGS+=' -ffat-lto-objects'
  make OPTIM="$CFLAGS" dep
  make OPTIM="$CFLAGS"
}

package() {
  cd $pkgname-$pkgver

  make OPTIM="$CFLAGS" INSTBASEDIR="$pkgdir"/usr/ install

  for i in ChangeLog CREDITS INSTALL README; do
    install -Dm644 $i "$pkgdir"/usr/share/doc/$pkgname/$i
  done
}
