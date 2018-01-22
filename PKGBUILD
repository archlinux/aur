# Maintainer: Clint Valentine <valentine.clint@gmail.com>

pkgname='artemis'
pkgver=16.0.17
pkgrel=1
pkgdesc='A free genome viewer and annotation tool that allows visualization of biological sequence features'
arch=('x86_64')
url=http://www.sanger.ac.uk/resources/software/"${artemis}"
license=('GPL2')
depends=('java-runtime>=1.6')
source=("${pkgname}"-"${pkgver}".tar.gz::ftp://ftp.sanger.ac.uk/pub/resources/software/"${pkgname}"/"${pkgname}".tar.gz)
sha256sums=('84a79eef8887994facb786ed095400ca5d7ddbfb1b126b2f3906db3dc1775813')

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

  install -Dm644 README "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}
