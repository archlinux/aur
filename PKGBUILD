# Maintainer: Dmitry Chusovitin <dchusovitin@gmail.com>
# Maintainer: Frederik Schwan <freswa at archlinux dot org>
# Maintainer: Juan Francisco Miranda <jfmiranda at gmail dot com>

pkgbase=datagrip-eap
_pkgbase=${pkgbase/-eap/}
pkgname=(datagrip-eap datagrip-eap-jre)
pkgver=253.27864.43
#_pkgver=2025.3
_pkgver=${pkgver}
pkgrel=1
pkgdesc='Smart SQL Editor and Advanced Database Client Packed Together for Optimum Productivity (EAP)'
arch=('x86_64' 'aarch64')
url='https://www.jetbrains.com/datagrip/'
license=('custom:jetbrains')
depends=('glib2')
conflicts=('0xdbe' '0xdbe-eap')
options=('!strip')
source=(
  "jetbrains-${pkgbase}.desktop"
  'LICENSE'
)
source_x86_64=("Datagrip-${_dlver}-${arch[0]}.tar.gz::https://download.jetbrains.com/${_pkgbase}/${_pkgbase}-${_pkgver}.tar.gz")
source_aarch64=("Datagrip-${_dlver}-${arch[1]}.tar.gz::https://download.jetbrains.com/${_pkgbase}/${_pkgbase}-${_pkgver}-aarch64.tar.gz")
sha256sums=('140cefe7ca857546ab5b548ff64909dbda6ebdaf735ee203ba02e0a32f217a5e'
            'c37db68dbedb20617a23cf1299cd95e7f114f019ff7f44877409cef916ff6ab1')
sha256sums_x86_64=('05d9cf205d2babce5e068bf6f9998503f3d49819bfd4372197ad09a5d4321f41')
sha256sums_aarch64=('55b244e18068375335981e974959f4674f843f1575fa3f0aeef49f6e889c51a7')

package_datagrip-eap() {
  optdepends=('datagrip-eap-jre: JetBrains custom Java Runtime (Recommended)'
              'java-runtime=17: JRE - Required if datagrip-jre is not installed')

  install -dm755 "${pkgdir}"/opt/
  install -dm755 "${pkgdir}"/usr/bin/
  install -dm755 "${pkgdir}"/usr/share/applications/
  install -dm755 "${pkgdir}"/usr/share/pixmaps/

  cp -a "${srcdir}"/DataGrip-${_pkgver}/ "${pkgdir}"/opt/${pkgbase}
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
  cp -a "${srcdir}"/DataGrip-${_pkgver}/jbr "${pkgdir}"/opt/${pkgbase}
}
