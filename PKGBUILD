# Maintainer: Andrew Shark <ashark[at]linuxcomp[dot]ru>

pkgbase=writerside-eap
pkgname=(writerside-eap writerside-eap-jre)
pkgver=232.10165
pkgrel=1
pkgdesc="Technical writing environment from JetBrains. Early Access Program."
arch=('x86_64')
options=('!strip')
url='https://www.jetbrains.com/writerside/'
license=('Commercial')
_pkgname="writerside"

source=(https://download.jetbrains.com/${_pkgname}/${_pkgname}-${pkgver}.tar.gz
        writerside-eap.desktop)
sha256sums=('d9d7dab78da28b725cf5df7e433003624947e585c914311c90845d49452c3586'
            '58d34eb19f91270394b7fa17443ebf0546e47ba96c41119142d1126726260a57')

package_writerside-eap() {
  optdepends=('writerside-eap-jre: JetBrains custom Java Runtime (Recommended)'
              'java-runtime: JRE - Required if writerside-eap-jre is not installed')

  cd "${srcdir}"
  mkdir -p "${pkgdir}/opt/${pkgname}"
  cp --recursive ${srcdir}/${_pkgname}-${pkgver}/* "${pkgdir}/opt/${pkgname}"
  rm -rf "${pkgdir}"/opt/${pkgname}/jbr

  mkdir -p "${pkgdir}/usr/bin"
  mkdir -p "${pkgdir}/usr/share/applications"
  mkdir -p "${pkgdir}/usr/share/pixmaps"
  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"

  install -m 644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications"
  install -m 644 "${pkgdir}/opt/${pkgname}/bin/${_pkgname}.svg" "${pkgdir}/usr/share/pixmaps/${pkgname}.svg"

  ln -s "/opt/${pkgname}/bin/${_pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
}

package_writerside-eap-jre() {
  pkgdesc="JBR (JetBrains Runtime) for WebStorm EAP - a patched JRE"
  url='https://github.com/JetBrains/JetBrainsRuntime'

  install -dm755 "${pkgdir}"/opt/${pkgbase}
  cp -a "${srcdir}/${_pkgname}-${pkgver}/jbr" "${pkgdir}/opt/${pkgbase}"
}
