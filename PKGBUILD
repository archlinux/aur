# Maintainer: Sedeer el-Showk <s.elshowk@netherrealm.net>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

pkgname=fastqc
_pkgname=FastQC
pkgver=0.12.1
pkgrel=3
pkgdesc='A quality control tool for high throughput sequence data.'
arch=('any')
url="http://www.bioinformatics.babraham.ac.uk/projects/fastqc"
license=('GPL3')
depends=('perl' 'java-runtime>=11' 'ttf-dejavu')
makedepends=('ant' 'java-environment>=11')
source=("$pkgname-$pkgver::https://github.com/s-andrews/FastQC/archive/refs/tags/v${pkgver}.tar.gz"
	"$pkgname.patch::https://github.com/s-andrews/FastQC/commit/e73f094ec165882cc71707a5dd5d3dd263a51b83.patch")
md5sums=('2d22a29649394f589e6f03d8d8c3eec9'
         '37a54b16eeb73d39a88893e326192e29')
prepare() {
  cd $_pkgname-$pkgver
  patch -p1 < $srcdir/$pkgname.patch
}
build() {
  cd $_pkgname-$pkgver
  ant
}
package() {
  mkdir -p $pkgdir/usr/share/$pkgname/
  cp -r $srcdir/$_pkgname-$pkgver/bin/* $pkgdir/usr/share/$pkgname/

  mkdir -p "${pkgdir}/usr/bin/"
  chmod 755 $pkgdir/usr/share/$pkgname/fastqc
  ln -s "/usr/share/$pkgname/fastqc" "${pkgdir}/usr/bin/"
}
