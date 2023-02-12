# Maintainer: Bipin Kumar <bipin@ccmb.res.in>

pkgname=fastq-trim
pkgver=0.1.2
pkgrel=1
pkgdesc="Lightening fast read trimmer"
arch=('i686' 'x86_64')
url="https://github.com/auerlab/fastq-trim"
license=('BSD-2')
depends=('biolibc' 'libxtend' 'bash')
source=("$pkgname-$pkgver.tar.gz::https://github.com/auerlab/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('9b265aa6cc410a20479ff60d7fd5aa02c9a89c57624290887df4b9129aa1a70c')

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
