# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=preseq
pkgver=2.0.2
pkgrel=1
pkgdesc="A tool for predicting and estimating the complexity of a genomic sequencing library, equivalent to predicting and estimating the number of redundant reads from a given sequencing depth."
arch=('i686' 'x86_64')
url="http://smithlabresearch.org/software/preseq/"
depends=('gsl')
license=('GPLv3')
source=("https://github.com/smithlabcode/${pkgname}/releases/download/v${pkgver}/${pkgname}_v${pkgver}.tar.bz2")
#source=("https://github.com/smithlabcode/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('9f2a7b597c9f08b821db6ee55e2ea39c')

prepare() {
  cd "${pkgname}_v${pkgver}"
  make clean
}

build() {
  cd "${pkgname}_v${pkgver}"
  make all
}

package() {
  mkdir -p "${pkgdir}/opt/${pkgname}"
  cp -a "${pkgname}_v${pkgver}/"* "${pkgdir}/opt/${pkgname}"
  mkdir -p "${pkgdir}/usr/bin/"
  ln -s /opt/${pkgname}/preseq ${pkgdir}/usr/bin/preseq
  ln -s /opt/${pkgname}/bam2mr ${pkgdir}/usr/bin/bam2mr
}

