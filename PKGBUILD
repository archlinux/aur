# Current maintainer: Musikolo <musikolo {at} hotmail [dot] com>
# Previous maintainer: Joseph Post <joe [at] jcpst [dot] com>
# Previous maintainer: Andrew Paugh <andrew [dot] paugh [at] gmail [dot] com>
# Updates by maintainer: Chris Fordham <chris [at] fordham [hyphon] nagy [dot] id [dot] au>
# Original maintainer: Marcin

pkgname=spring-tool-suite
pkgver=4.15.1
_pkgver_release=$pkgver.RELEASE
_eclipse_pkgver=e4.24.0
_eclipse_pkgver_short=e4.24
pkgrel=1
pkgdesc="The Spring Tool Suite (STS) from SpringSource"
arch=('x86_64')
url="https://spring.io/tools"
depends=('unzip' 'webkit2gtk')
conflicts=('springsource-tool-suite')
install=${pkgname}.install
license=("EPL/1.1")

source_x86_64=(
    "https://download.springsource.com/release/STS4/${_pkgver_release}/dist/${_eclipse_pkgver_short}/${pkgname}-4-${_pkgver_release}-${_eclipse_pkgver}-linux.gtk.x86_64.tar.gz"
    "${pkgname}.desktop"
)
sha256sums_x86_64=('4b346886f9f89e3d490a9e7dc72fdf4d446fba496a90d16f4047e8c598ed5087'
                   '11c51ae27864a5c529f832506cb740c0681ad9d51c4b5f69212f61890d6aafac')

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
