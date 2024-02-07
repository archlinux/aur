# Maintainer: Andrew Shark <ashark[at]linuxcomp[dot]ru>

pkgbase=writerside-eap
pkgname=(writerside-eap writerside-eap-jre)
pkgver=233.14389
pkgrel=1
pkgdesc="Documentation authoring IDE from JetBrains. Early Access Program."
arch=("x86_64")
options=("!strip")
url="https://www.jetbrains.com/writerside/"
license=("Commercial")
_pkgname="writerside"

source=(https://download.jetbrains.com/${_pkgname}/${_pkgname}-${pkgver}.tar.gz
        writerside-eap.desktop)
sha256sums=("04a8475ddb26b94168bcaaf35eb861e3e1283e0a9b7f494f131b8df0a3c90e93"
            "4aa5408b4aa3fb083e6c54d267c9fb8aa010bafd5a11e84fb404d0ea99890bc2")

package_writerside-eap() {
  optdepends=("writerside-eap-jre: JetBrains custom Java Runtime (Recommended)"
              "java-runtime: JRE - Required if writerside-eap-jre is not installed")

  cd "${srcdir}"
  mkdir -p "${pkgdir}/opt/${pkgname}"
  cp --recursive "${srcdir}"/${_pkgname}-${pkgver}/* "${pkgdir}/opt/${pkgname}"
  rm -rf "${pkgdir}"/opt/${pkgname}/jbr

  mkdir -p "${pkgdir}/usr/bin"
  mkdir -p "${pkgdir}/usr/share/applications"
  mkdir -p "${pkgdir}/usr/share/pixmaps"
  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"

  # From the installation guide documentation (https://www.jetbrains.com/help/pycharm/installation-guide.html#standalone):
    # To create a desktop entry, do one of the following:
      # On the Welcome screen, click Configure | Create Desktop Entry
      # From the main menu, click Tools | Create Desktop Entry
  install -m 644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications"

  ln -s "/opt/${pkgname}/bin/${_pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
}

package_writerside-eap-jre() {
  pkgdesc="JBR (JetBrains Runtime) for Writerside EAP"
  url="https://github.com/JetBrains/JetBrainsRuntime"

  install -dm755 "${pkgdir}"/opt/${pkgbase}
  cp -a "${srcdir}/${_pkgname}-${pkgver}/jbr" "${pkgdir}/opt/${pkgbase}"
}
