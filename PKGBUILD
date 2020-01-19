# Maintainer: Clint Valentine <valentine.clint@gmail.com>

pkgname='artemis'
pkgver=18.1.0
pkgrel=1
pkgdesc='A genome viewer and annotation tool that visualizes biological sequence features'
arch=('x86_64')
url=https://www.sanger.ac.uk/science/tools/"${pkgname}"
license=('GPL2')
depends=('java-runtime>=1.6')
source=("${pkgname}"-"${pkgver}".tar.gz::https://github.com/sanger-pathogens/Artemis/releases/download/v${pkgver}/artemis-unix-release-${pkgver}.tar.gz)
sha256sums=('c1a159f80ac5548227a7ef2ec02f72fbc90b1ccd3f8a27fb26d8c220b283a034')

package() {
  cd "${srcdir}"/"${pkgname}"

  sed -i 's#ARTEMIS_HOME=`dirname "$PRG"`/.#ARTEMIS_HOME=/opt/artemis/#' art
  sed -i 's#ACT_HOME=`dirname "$PRG"`/.#ACT_HOME=/opt/artemis/#' act
  sed -i 's#ARTEMIS_HOME=`dirname "$PRG"`/.#ARTEMIS_HOME=/opt/artemis/#' dnaplotter

  mkdir -p "${pkgdir}"/opt/"${pkgname}"/
  cp -a * "${pkgdir}"/opt/"${pkgname}"/

  scripts=('act' 'art' 'dnaplotter')
  for script in "${scripts[@]}"; do
    install -Dm775 "${script}" "${pkgdir}"/usr/bin/"${script}"
    rm "${pkgdir}"/opt/"${pkgname}"/"${script}"
  done

  install -Dm644 README.md "${pkgdir}"/usr/share/doc/"${pkgname}"/README.md
}
