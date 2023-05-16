# Maintainer: Butui Hu <hot123tea123@gmail.com>
# Contributor: Steffen Weber <-boenki-gmx-de->
# Contributor: Mick Elliot <micke at sfu dot ca>

pkgname=mafft
pkgver=7.520
pkgrel=1
pkgdesc='Multiple alignment program for amino acid or nucleotide sequences. https://doi.org/10.1093/molbev/mst010'
arch=('x86_64')
url='https://mafft.cbrc.jp/alignment/software'
license=('BSD')
depends=(
  perl
)
source=("${pkgname}-${pkgver}.tgz::https://gitlab.com/sysimm/mafft/-/archive/v${pkgver}/mafft-v${pkgver}.tar.gz")
sha1sums=('5cf29b694d1bea803b3bb671ea38f9c24e4c216c')

build() {
  make -C "${pkgname}-v${pkgver}/core" PREFIX=/usr LIBDIR=/usr/lib/mafft
  make -C "${pkgname}-v${pkgver}/extensions" PREFIX=/usr LIBDIR=/usr/lib/mafft
}

package() {
  make DESTDIR="${pkgdir}" -C "${pkgname}-v${pkgver}/core" install PREFIX=/usr LIBDIR=/usr/lib/mafft
  make DESTDIR="${pkgdir}" -C "${pkgname}-v${pkgver}/extensions" install PREFIX=/usr LIBDIR=/usr/lib/mafft
  rm -vf "${pkgdir}/usr/lib/mafft/mafft-homologs.1" "${pkgdir}/usr/lib/mafft/mafft.1"
}
