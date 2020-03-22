# Current maintainer: Musikolo <musikolo {at} hotmail [dot] com>
# Previous maintainer: Joseph Post <joe [at] jcpst [dot] com>
# Previous maintainer: Andrew Paugh <andrew [dot] paugh [at] gmail [dot] com>
# Updates by maintainer: Chris Fordham <chris [at] fordham [hyphon] nagy [dot] id [dot] au>
# Original maintainer: Marcin

pkgname=spring-tool-suite
pkgver=4.6.0
_pkgver_release=$pkgver.RELEASE
_eclipse_pkgver=e4.15.0
_eclipse_pkgver_short=e4.15
pkgrel=1
pkgdesc="The Spring Tool Suite (STS) from SpringSource"
arch=('x86_64')
url="https://spring.io/tools"
depends=('java-environment' 'unzip' 'webkit2gtk')
conflicts=('springsource-tool-suite')
install=${pkgname}.install
license=("EPL/1.1")

source_x86_64=(
    "http://download.springsource.com/release/STS4/${_pkgver_release}/dist/${_eclipse_pkgver_short}/${pkgname}-4-${_pkgver_release}-${_eclipse_pkgver}-linux.gtk.x86_64.tar.gz"
    "${pkgname}.desktop"
)
sha256sums_x86_64=('cefb5da19940a44c3559ec08c6c9c3703eef48aa8c9d032bf91a61a287f99a39'
                   '4f3891945c9f86d2efa5b388d0da74d323b28795c46cbb35c56073e1e4cade32')

package() {
    # install eclipse
    install -m755 -d "${pkgdir}/opt"
    mv "${srcdir}/sts-${_pkgver_release}" "${pkgdir}/opt/"

    # install misc
    install -d ${pkgdir}/usr/bin ${pkgdir}/usr/share/applications
    install -m644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/"
    ln -s "/opt/sts-${_pkgver_release}/SpringToolSuite4" ${pkgdir}/usr/bin/STS

    # install icon
    install -m755 -d "${pkgdir}/usr/share/icons/hicolor/scalable/apps"
    ln -s "/opt/sts-${_pkgver_release}/icon.xpm" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.xpm"
}
