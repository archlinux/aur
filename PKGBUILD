# Current maintainer: Joseph Post <joe [at] jcpst [dot] com>
# Previous maintainer: Andrew Paugh <andrew [dot] paugh [at] gmail [dot] com>
# Updates by maintainer: Chris Fordham <chris [at] fordham [hyphon] nagy [dot] id [dot] au>
# Original maintainer: Marcin

pkgname=spring-tool-suite
pkgver=3.8.0
_pkgver_release=$pkgver.RELEASE
_eclipse_pkgver=e4.6
_eclipse_pkgver_short=e4.6
pkgrel=1
pkgdesc="The Spring Tool Suite (STS) from SpringSource"
arch=('i686' 'x86_64')
url="http://www.springsource.com/developer/sts"
depends=('java-environment' 'gtk2' 'unzip' 'libwebkit')
conflicts=('springsource-tool-suite')
install=${pkgname}.install
makedepends=('zip')
license=("EPL/1.1")

source=(
    "http://dist.springsource.com/release/STS/${_pkgver_release}/dist/${_eclipse_pkgver_short}/${pkgname}-${_pkgver_release}-${_eclipse_pkgver}-linux-gtk-x86_64.tar.gz"
    "${pkgname}.xpm"
    "${pkgname}.desktop"
)

md5sums=('6f5b1199eb84bd02567c10e7f02cbbae'
         '947d3e62d478ef537f2f2b79dac6a405'
         '713d62c23b173881bf74050718ef3d3f')
[ "$CARCH" = "i686" ] && source[0]="http://dist.springsource.com/release/STS/${_pkgver_release}/dist/${_eclipse_pkgver_short}/${pkgname}-${_pkgver_release}.RELEASE-${_eclipse_pkgver}-linux-gtk.tar.gz"
[ "$CARCH" = "i686" ] && md5sums[0]='507c52872083017eaeccec6a838ca2c2'

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

