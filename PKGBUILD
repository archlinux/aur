# Maintainer: Andrew Shark <ashark[at]linuxcomp[dot]ru>

pkgbase=writerside-eap
pkgname=(writerside-eap writerside-eap-jre)
pkgver=243.22562.371
pkgrel=1
pkgdesc="Documentation authoring IDE from JetBrains. Early Access Program."
arch=("x86_64")
options=("!strip")
url="https://www.jetbrains.com/writerside/"
license=("Commercial")
_pkgname="writerside"

source=(https://download.jetbrains.com/${_pkgname}/${_pkgname}-${pkgver}.tar.gz
        writerside-eap.desktop)
sha256sums=("d49e58020d51ec4ccdbdffea5d42b5a2d776a809fc00789cef5abda7b23bd3f6"
            "edba515d4fc04bf417fa9ab2da31cccebfe3c00cb8013cede909f6550650df7f")

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
