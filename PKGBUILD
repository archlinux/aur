# Maintainer: Clint Valentine <valentine.clint@gmail.com>

pkgname='artemis'
pkgver=18.2.0
pkgrel=5
pkgdesc='A genome viewer and annotation tool that visualizes biological sequence features'
arch=('x86_64')
url=https://www.sanger.ac.uk/science/tools/"${pkgname}"
license=('GPL2')
depends=('java-runtime>=1.6')
source=("${pkgname}"-"${pkgver}".tar.gz::https://github.com/sanger-pathogens/Artemis/releases/download/v${pkgver}/artemis-unix-release-${pkgver}.tar.gz)
sha256sums=('06441e1abab139cb0a09d5844cb1b84ae727ace53a6c0efdd1eea8d8cfab8382')

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
