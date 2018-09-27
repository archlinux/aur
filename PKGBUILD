# Current maintainer: Musikolo <musikolo {at} hotmail [dot] com>
# Previous maintainer: Joseph Post <joe [at] jcpst [dot] com>
# Previous maintainer: Andrew Paugh <andrew [dot] paugh [at] gmail [dot] com>
# Updates by maintainer: Chris Fordham <chris [at] fordham [hyphon] nagy [dot] id [dot] au>
# Original maintainer: Marcin

pkgname=spring-tool-suite
pkgver=3.9.6
_pkgver_release=$pkgver.RELEASE
_eclipse_pkgver=e4.9.0
_eclipse_pkgver_short=e4.9
pkgrel=1
pkgdesc="The Spring Tool Suite (STS) from SpringSource"
arch=('i686' 'x86_64')
url="https://spring.io/tools/sts"
depends=('java-environment' 'unzip' 'webkit2gtk')
conflicts=('springsource-tool-suite')
install=${pkgname}.install
license=("EPL/1.1")

source_x86_64=(
    "http://download.springsource.com/release/STS/${_pkgver_release}/dist/${_eclipse_pkgver_short}/${pkgname}-${_pkgver_release}-${_eclipse_pkgver}-linux-gtk-x86_64.tar.gz"
    "${pkgname}.xpm"
    "${pkgname}.desktop"
)
source_i686=(
    "http://download.springsource.com/release/STS/${_pkgver_release}/dist/${_eclipse_pkgver_short}/${pkgname}-${_pkgver_release}-${_eclipse_pkgver}-linux-gtk.tar.gz"
    "${pkgname}.xpm"
    "${pkgname}.desktop"
)
sha256sums_i686=('afc6cf962acc96d77abb7b55c49a25faeba41e3d6c7e6e702e15caf91a01befc'
                 'befd7eabe15dc90b947c8d878a06649767c4e5a0c5777a1ba4ed297db9bafc1f'
                 'a8f45ab4a86b7ad01b9050be2ebaa44d4be437371ffab2d136c960149aa0b7fd')
sha256sums_x86_64=('f3d729612cc64f9d5888368867fd8c064914d61d769c65a242d5fa8d0770b787'
                   'befd7eabe15dc90b947c8d878a06649767c4e5a0c5777a1ba4ed297db9bafc1f'
                   'a8f45ab4a86b7ad01b9050be2ebaa44d4be437371ffab2d136c960149aa0b7fd')

package() {
    cd "${srcdir}/sts-bundle"

    # install eclipse
    install -m755 -d "${pkgdir}/opt"
    mv "${srcdir}/sts-bundle" "${pkgdir}/opt/sts-bundle"

    # install misc
    install -d ${pkgdir}/usr/bin ${pkgdir}/usr/share/applications
    install -m644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/"
    ln -s "/opt/sts-bundle/sts-${pkgver}.RELEASE/STS" ${pkgdir}/usr/bin/STS

    # install icon
    install -Dm644 ${srcdir}/${pkgname}.xpm ${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.xpm
}
