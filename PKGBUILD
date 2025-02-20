#Maintainer: Guoyi Zhang <guoyizhang@malacology.net>

pkgname=stacks
pkgver=2.68
pkgrel=2
pkgdesc="building loci from short-read sequences https://dx.doi.org/10.1111/mec.15253"
arch=('x86_64')
url="https://catchenlab.life.illinois.edu/stacks/"
depends=('gcc-libs' 'r' 'perl' 'python')
makedepends=('make' 'gcc' 'openmpi')
optdepends=('openmpi: for parallel')
license=('GPL-3.0-or-later')
source=("https://catchenlab.life.illinois.edu/stacks/source/stacks-${pkgver}.tar.gz")
md5sums=('8b7d8437d45b9d78c4e95a50c8e55c67')

build() {
  cd "${pkgname}-${pkgver}"
  ./configure --prefix="${pkgdir}/usr"
  make all
}

package() {
  cd "${pkgname}-${pkgver}"
  make install

  for pl_bin in ref_map.pl denovo_map.pl
  do
    sed -i "s@/build/stacks/pkg/stacks/usr/bin/@/usr/bin/@" $pkgdir/usr/bin/$pl_bin
  done

}

