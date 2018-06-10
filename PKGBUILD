# Maintainer: Clint Valentine <valentine.clint@gmail.com>

pkgname='artemis'
pkgver=17.0.1
pkgrel=1
pkgdesc='A genome viewer and annotation tool that visualizes biological sequence features'
arch=('x86_64')
url=https://www.sanger.ac.uk/science/tools/"${pkgname}"
license=('GPL2')
depends=('java-runtime>=1.6')
source=("${pkgname}"-"${pkgver}".tar.gz::ftp://ftp.sanger.ac.uk/pub/resources/software/"${pkgname}"/v"${pkgver%.*.*}"/v"${pkgver}"/"${pkgname}"_compiled_v"${pkgver}".tar.gz)
sha256sums=('4bea5f5c3dab3883f6ec1639adb55190c28f563bcb20e3fdbe0687bd1adccba5')

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
