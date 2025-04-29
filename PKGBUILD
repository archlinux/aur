# Maintainer: Bipin Kumar <kbipinkumar@pm.me>

pkgname=fastq-trim
pkgver=0.1.4
pkgrel=1
pkgdesc="Lightening fast read trimmer"
arch=('i686' 'x86_64')
url="https://github.com/auerlab/fastq-trim"
license=('BSD-2')
depends=('biolibc' 'libxtend' 'bash')
source=("$pkgname-$pkgver.tar.gz::https://github.com/auerlab/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('e31cdccdf0e68f68142917fffaceb9e814b3f217382c2e0f3663a6e1c7a13bb6')

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
