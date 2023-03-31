# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Filip Wojciechowski, filip at loka dot pl

pkgname=cpuburn
pkgver=1.4a
pkgrel=7
pkgdesc="CPU testing utilities in optimized assembler for maximum loading of CPUs"
arch=('x86_64')
url="https://launchpad.net/ubuntu/+source/cpuburn/"
license=('GPL')
depends=()
source=("https://launchpad.net/ubuntu/+archive/primary/+files/cpuburn_$pkgver.orig.tar.gz"
	cpuburn.patch)
sha256sums=('eb191ce9bfbf453d30c218c3419573df102a3588f96c4a43686c84bb9da4bed6'
            '984cbb5479ebe6b39ead3bcd50f508c8403d137e9d5d55d5609570581fd6ef99')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -Np1 -i ../cpuburn.patch
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  for i in burn{BX,K6,K7,MMX,P5,P6}; do
    install -Dm755 $i "$pkgdir/usr/bin/$i"
  done
  install -Dm644 README "$pkgdir/usr/share/doc/$pkgname/README"
  install -Dm644 Design "$pkgdir/usr/share/doc/$pkgname/Design"
}
