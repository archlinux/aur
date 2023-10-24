# Maintainer: Bipin Kumar <kbipinkumar@pm.me>

pkgname=fastq-trim
pkgver=0.1.3
pkgrel=1
pkgdesc="Lightening fast read trimmer"
arch=('i686' 'x86_64')
url="https://github.com/auerlab/fastq-trim"
license=('BSD-2')
depends=('biolibc' 'libxtend' 'bash')
source=("$pkgname-$pkgver.tar.gz::https://github.com/auerlab/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('ae40371ee7898308fef5eb20018bb5a8f5022e67307eccfac3d23084cdc0a093')

build() {
  cd "$pkgname-$pkgver"
  export VERSION=${pkgver}
  make clean depend
  make PREFIX="/usr"
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR=$pkgdir PREFIX=/usr MANPREFIX=/usr/share install
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
