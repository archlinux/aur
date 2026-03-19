# Current maintainer: Musikolo <musikolo {at} hotmail [dot] com>
# Previous maintainer: Joseph Post <joe [at] jcpst [dot] com>
# Previous maintainer: Andrew Paugh <andrew [dot] paugh [at] gmail [dot] com>
# Updates by maintainer: Chris Fordham <chris [at] fordham [hyphon] nagy [dot] id [dot] au>
# Original maintainer: Marcin

pkgname=spring-tools-for-eclipse
pkgver=5.1.1
_pkgver_release=$pkgver.RELEASE
_eclipse_pkgver=e4.39.0
_eclipse_pkgver_short=e4.39
pkgrel=1
pkgdesc="Spring Tools, aka Spring Tool Suite (STS), is the next generation of Spring tooling for Eclipse IDE."
arch=('x86_64')
url="https://spring.io/tools"
depends=('unzip' 'webkit2gtk' 'java-runtime>=21')
provides=('spring-tool-suite')
conflicts=('spring-tool-suite')
install=${pkgname}.install
license=("EPL/1.1")
options=("!debug")
source=(
    "https://cdn.spring.io/spring-tools/release/dist/${_pkgver_release}/${_eclipse_pkgver_short}/${pkgname}-${_pkgver_release}-${_eclipse_pkgver}-linux.gtk.${arch}.tar.gz"
    "${pkgname}.desktop"
    "spring-tools-for-eclipse.install"
)
sha256sums=('044b54c2100c0b92e50bc78cda39883c57f82cff341f514e16fa0f2b1705ae8a'
            '1e2e23447e1d616480a790f36807ee64630a4ad71345834633e4e8f6e9bba066'
            '99655c1631a60d8f3358488bf66b442dc8bb4abfae98681a49248399dfe10cd0')

package() {
    # Install eclipse to version-agnostic st4e dirirectory
    install -m755 -d "${pkgdir}/opt"
    mv "${srcdir}/sts-${_pkgver_release}" "${pkgdir}/opt/st4e"

    # Install misc
    install -d ${pkgdir}/usr/bin ${pkgdir}/usr/share/applications
    install -m644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/"
    ln -s "/opt/st4e/SpringToolsForEclipse" ${pkgdir}/usr/bin/SpringToolsForEclipse

    # Install icon
    install -m755 -d "${pkgdir}/usr/share/icons/hicolor/scalable/apps"
    ln -s "/opt/st4e/icon.xpm" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.xpm"
}
