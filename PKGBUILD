# Maintainer: Guoyi Zhang <guoyi zhang at malacology dot net>

pkgname=mcscanx
_pkgname=MCScanX
pkgver=r53.b1ca533
pkgrel=4
pkgdesc="Multiple Collinearity Scan toolkit X version https://doi.org/10.1093/nar/gkr1293"
arch=('x86_64')
url="https://github.com/wyp1125/MCScanX"
license=('BSD')
depends=('java-runtime=11' 'glibc')
makedepends=('make' 'git' 'java-environment=11')
optdepends=('perl')
source=(git+https://github.com/wyp1125/MCScanX.git)
sha256sums=('SKIP')
pkgver(){
  cd $_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$_pkgname"
  make
}

package() {
  cd "$_pkgname"
  for bin in "duplicate_gene_classifier" "MCScanX" "MCScanX_h"
do
	install -D -m 755 $bin $pkgdir/usr/bin/$bin
done
  cd downstream_analyses
  for downstream in *.java *.pl detect_collinear_tandem_arrays dissect_multiple_alignment
do
	install -D -m 755 $downstream $pkgdir/usr/share/$pkgname/$downstream
done

}

