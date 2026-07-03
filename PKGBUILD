# Maintainer: Dmitry Chusovitin <dchusovitin@gmail.com>
# Maintainer: Frederik Schwan <freswa at archlinux dot org>
# Maintainer: Juan Francisco Miranda <jfmiranda at gmail dot com>

pkgbase=datagrip-eap
_pkgbase=${pkgbase/-eap/}
pkgname=(datagrip-eap datagrip-eap-jre)
pkgver=262.8377.45
_pkgver=2026.2
pkgrel=1
pkgdesc='Smart SQL Editor and Advanced Database Client Packed Together for Optimum Productivity (EAP)'
arch=('x86_64' 'aarch64')
url='https://www.jetbrains.com/datagrip/nextversion/'
license=('custom:jetbrains')
depends=('glib2')
conflicts=('0xdbe' '0xdbe-eap')
options=('!strip')
source=(jetbrains-datagrip-eap.desktop
        LICENSE)
source_x86_64=("Datagrip-${pkgver}-${arch[0]}.tar.gz::https://download.jetbrains.com/${_pkgbase}/${_pkgbase}-${pkgver}.tar.gz")
source_aarch64=("Datagrip-${pkgver}-${arch[1]}.tar.gz::https://download.jetbrains.com/${_pkgbase}/${_pkgbase}-${pkgver}-aarch64.tar.gz")
sha256sums=('140cefe7ca857546ab5b548ff64909dbda6ebdaf735ee203ba02e0a32f217a5e'
            'c37db68dbedb20617a23cf1299cd95e7f114f019ff7f44877409cef916ff6ab1')
sha256sums_x86_64=('975bc4a1cfe8cb2b04b286b09d9cdc7cad16c303b35b7794ed5abc78dfc7cf13')
sha256sums_aarch64=('2ac7d9ac9af78f5939dc3acbf08acec1e87c8c39c4592e6a67b9f3ed191648aa')

package_datagrip-eap() {
  optdepends=('datagrip-eap-jre: JetBrains custom Java Runtime (Recommended)'
              'java-runtime: JRE - Required if datagrip-jre is not installed')

  install -dm755 "${pkgdir}"/opt/
  install -dm755 "${pkgdir}"/usr/bin/
  install -dm755 "${pkgdir}"/usr/share/applications/
  install -dm755 "${pkgdir}"/usr/share/pixmaps/

  cp -a "${srcdir}"/DataGrip-${pkgver}/ "${pkgdir}"/opt/${pkgbase}
  rm -rf "${pkgdir}"/opt/${pkgbase}/jbr

  ln -s /opt/${pkgbase}/bin/${_pkgbase}.sh "${pkgdir}"/usr/bin/${pkgbase}
  install -m644 "${srcdir}"/jetbrains-${pkgbase}.desktop "${pkgdir}"/usr/share/applications/
  install -m644 "${pkgdir}"/opt/${pkgbase}/bin/${_pkgbase}.svg "${pkgdir}"/usr/share/pixmaps/${pkgbase}.svg
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE.txt
}

package_datagrip-eap-jre() {
  pkgdesc='JBR (JetBrains Runtime) for DataGrip - a patched JRE'
  url='https://github.com/JetBrains/JetBrainsRuntime'
  install -dm755 "${pkgdir}"/opt/${pkgbase}
  cp -a "${srcdir}"/DataGrip-${pkgver}/jbr "${pkgdir}"/opt/${pkgbase}
}
