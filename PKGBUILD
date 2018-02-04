# Maintainer: Clint Valentine <valentine.clint@gmail.com>
pkgname=qualimap
pkgver=2.2.1
pkgrel=2
pkgdesc="Utility to evaluate the quality of next-generation sequencing data"
arch=('any')
url=https://qualimap.bioinfo.cipf.es
license=('GPL2')
depends=('r' 'java-runtime>=6' 'java-runtime-openjdk>=6')
install="${pkgname}".install
source=(http://bitbucket.org/kokonech/"${pkgname}"/downloads/"${pkgname}"_"v${pkgver}".zip)
sha256sums=('08f1d66e49c83c76c56c4225c53aee44f41e0592c8bdc84b8c4ecd975700e045')

prepare() {
  cd "${srcdir}"/"${pkgname}"_v"${pkgver}"
  sed -i s#'QUALIMAP_HOME=.*'#QUALIMAP_HOME=/usr/share/"${pkgname}"_v"${pkgver}"# "${pkgname}"
}

package() {
  cd "${srcdir}"/"${pkgname}"_v"${pkgver}"

  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
  install -Dm644 HISTORY "${pkgdir}"/usr/share/licenses/"${pkgname}"/HISTORY

  # Install .jar dependencies, .R scripts, and packaged data.
  mkdir -p "${pkgdir}"/usr/share/"${pkgname}"
  cp -rf lib/     "${pkgdir}"/usr/share/"${pkgname}"/lib
  cp -rf scripts/ "${pkgdir}"/usr/share/"${pkgname}"/scripts
  cp -rf species/ "${pkgdir}"/usr/share/"${pkgname}"/species

  install -Dm775 "${pkgname}" "${pkgdir}"/usr/bin/"${pkgname}"
  install -Dm644 "${pkgname}".jar "${pkgdir}"/usr/share/"${pkgname}"/"${pkgname}".jar
}
