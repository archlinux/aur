# Maintainer: Sauliusl <luksaulius[at]gmail[dot]com>
pkgname=rseg
pkgver=0.4.4
pkgrel=1
pkgdesc="The RSEG software package is aimed to analyze ChIP-Seq data, especially for identifying genomic regions and their boundaries marked by diffusive histone modification markers, such as H3K36me3 and H3K27me3."
url="http://smithlabresearch.org/software/rseg/"
arch=('x86_64' 'i686')
license=('GPL3')
depends=('gsl')
optdepends=()
makedepends=('gsl')
conflicts=()
replaces=()
backup=()
install=''
source=("http://smithlabresearch.org/downloads/${pkgname}-${pkgver}.tar.gz")
sha256sums=('6b23b570097d449b910fba3244e0330729fa409995fbcc1b4890a99ee52891f2')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
  make install # This just puts files into bin/ directory
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/bin"
  install -d "${pkgdir}/usr/bin"
  install -Dm755 * "${pkgdir}/usr/bin/"
  # Rename the join utility so it does not clash with the one already in system
  mv "${pkgdir}/usr/bin/join" "${pkgdir}/usr/bin/rseg-join"
}

# vim:set ts=2 sw=2 et: