# Current maintainer: Musikolo <musikolo {at} hotmail [dot] com>
# Previous maintainer: Joseph Post <joe [at] jcpst [dot] com>
# Previous maintainer: Andrew Paugh <andrew [dot] paugh [at] gmail [dot] com>
# Updates by maintainer: Chris Fordham <chris [at] fordham [hyphon] nagy [dot] id [dot] au>
# Original maintainer: Marcin

pkgname=spring-tools-for-eclipse
pkgver=4.32.2
_pkgver_release=$pkgver.RELEASE
_eclipse_pkgver=e4.37.0
_eclipse_pkgver_short=e4.37
pkgrel=1
pkgdesc="Spring Tools, aka Spring Tool Suite (STS), is the next generation of Spring tooling for Eclipse IDE."
arch=('x86_64')
url="https://spring.io/tools"
depends=('unzip' 'webkit2gtk' 'java-runtime>=21')
provides=('spring-tool-suite')
conflicts=('spring-tool-suite')
install=${pkgname}.install
license=("EPL/1.1")

source=(
    "https://cdn.spring.io/spring-tools/release/STS4/${_pkgver_release}/dist/${_eclipse_pkgver_short}/${pkgname}-${_pkgver_release}-${_eclipse_pkgver}-linux.gtk.${arch}.tar.gz"
    "${pkgname}.desktop"
)
sha256sums=('c686b77656cc4c31df84b4a9573e18a37ffd7f1ef69ed625085441918720623a'
            'b7f7c92446da5d82a1a1982d8d1af3b98c2b29854579f4b04247001080e162f0')

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
