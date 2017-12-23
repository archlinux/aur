# Current maintainer: Musikolo <musikolo {at} hotmail [dot] com>
# Previous maintainer: Joseph Post <joe [at] jcpst [dot] com>
# Previous maintainer: Andrew Paugh <andrew [dot] paugh [at] gmail [dot] com>
# Updates by maintainer: Chris Fordham <chris [at] fordham [hyphon] nagy [dot] id [dot] au>
# Original maintainer: Marcin

pkgname=spring-tool-suite
pkgver=3.9.2
_pkgver_release=$pkgver.RELEASE
_eclipse_pkgver=e4.7.2
_eclipse_pkgver_short=e4.7
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
sha256sums_i686=('8a0ee78fc3e66a60b11b598403adec9697e3adc7942c0134aaa1fb91eea15dda'
                 'befd7eabe15dc90b947c8d878a06649767c4e5a0c5777a1ba4ed297db9bafc1f'
                 'a8f45ab4a86b7ad01b9050be2ebaa44d4be437371ffab2d136c960149aa0b7fd')
sha256sums_x86_64=('7008de99f719c62b13c79c01c7c8bd06576311c170d442eaf489c5411929617c'
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
