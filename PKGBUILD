# Maintainer: Bipin Kumar <bipin@ccmb.res.in>

pkgname=ad2vcf
pkgver=0.1.6
pkgrel=6
pkgdesc="Tool to add allelic depth info from a SAM stream to a VCF file"
arch=('i686' 'x86_64')
url="https://github.com/auerlab/ad2vcf"
license=('BSD-2')
depends=('biolibc' 'libxtend' 'glibc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/auerlab/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('fbed1e32504dbc6975cb124792d12e48576ed799ac148aa3b6beed33a67bdf98')

build() {
  cd "$pkgname-$pkgver"
  export VERSION=${pkgver}
  ./version.sh
  make PREFIX="/usr" depend
  make PREFIX="/usr"
}

package() {
  cd "$pkgname-$pkgver"
  make PREFIX="$pkgdir/usr" MANPREFIX="$pkgdir/usr/share" install
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
