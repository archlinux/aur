# Maintainer: Guoyi
pkgname=gffcompare
pkgver=0.12.10
pkgrel=1
pkgdesc="classify, merge, tracking and annotation of GFF files by comparing to a reference annotation GFF"
arch=('x86_64')
url="https://github.com/gpertea/gffcompare"
license=('MIT')
depends=()
makedepends=('make' 'git')
optdepends=()
source=(https://github.com/gpertea/gffcompare/archive/refs/tags/v${pkgver}.tar.gz
	gclib.patch::https://github.com/gpertea/gffcompare/compare/master...starsareintherose:gffcompare:patch-1.patch)
sha256sums=('c708798c873b83b7a3c8e5a779da885b4d24e6039eebc6990d235aa8efe77646'
            '75d2c678f71fc3436f170552187285ea08455c221fb7fdf60a8cbf8cb9134cf4')
prepare(){
  cd "${pkgname}"-$pkgver
#git clone https://github.com/gpertea/gclib.git
  patch -p1 -i ../gclib.patch
}

build() {
  cd "${pkgname}"-$pkgver
  make release
}

package() {
  cd "${pkgname}"-$pkgver
  install -Dm 755 $pkgname $pkgdir/usr/bin/$pkgname
  install -Dm 755 trmap $pkgdir/usr/bin/trmap
}
