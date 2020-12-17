# Current maintainer: Musikolo <musikolo {at} hotmail [dot] com>
# Previous maintainer: Joseph Post <joe [at] jcpst [dot] com>
# Previous maintainer: Andrew Paugh <andrew [dot] paugh [at] gmail [dot] com>
# Updates by maintainer: Chris Fordham <chris [at] fordham [hyphon] nagy [dot] id [dot] au>
# Original maintainer: Marcin

pkgname=spring-tool-suite
pkgver=4.9.0
_pkgver_release=$pkgver.RELEASE
_eclipse_pkgver=e4.18.0
_eclipse_pkgver_short=e4.18
pkgrel=1
pkgdesc="The Spring Tool Suite (STS) from SpringSource"
arch=('x86_64')
url="https://spring.io/tools"
depends=('java-environment' 'unzip' 'webkit2gtk')
conflicts=('springsource-tool-suite')
install=${pkgname}.install
license=("EPL/1.1")

source_x86_64=(
    "https://download.springsource.com/release/STS4/${_pkgver_release}/dist/${_eclipse_pkgver_short}/${pkgname}-4-${_pkgver_release}-${_eclipse_pkgver}-linux.gtk.x86_64.tar.gz"
    "${pkgname}.desktop"
)
sha256sums_x86_64=('fa285f62ac44ca5d672cc5abee5a77e92201a2bd69b2f6d5bc6312d39ac5f0c6'
                   '4f3891945c9f86d2efa5b388d0da74d323b28795c46cbb35c56073e1e4cade32')

package() {
    # Install eclipse to version-agnostic sts4 dirirectory
    install -m755 -d "${pkgdir}/opt"
    mv "${srcdir}/sts-${_pkgver_release}" "${pkgdir}/opt/sts4"

    # Install misc
    install -d ${pkgdir}/usr/bin ${pkgdir}/usr/share/applications
    install -m644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/"
    ln -s "/opt/sts4/SpringToolSuite4" ${pkgdir}/usr/bin/STS

    # Install icon
    install -m755 -d "${pkgdir}/usr/share/icons/hicolor/scalable/apps"
    ln -s "/opt/sts4/icon.xpm" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.xpm"

    # Create simlink for backward compatibility
    ln -s "/opt/sts4" "${pkgdir}/opt/sts-${_pkgver_release}"
}
