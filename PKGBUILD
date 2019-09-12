# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgname=ipmiview
pkgver=2.16.0
_pkghash=190528
pkgrel=2
pkgdesc="Supermicro IPMI tool"
makedepends=('tar')
depends=("glibc" "java-runtime=8")
arch=('x86_64')
license=('custom:"Super Micro Computer"')
url="http://www.supermicro.com/products/nfo/ipmi.cfm"

backup=('account.properties'
        'email.properties'
        'IPMIView.properties'
        'timeout.properties')

source=("https://www.supermicro.com/wftp/utility/IPMIView/Linux/IPMIView_${pkgver}_build.${_pkghash}_bundleJRE_Linux_x64.tar.gz"
        'ipmiview.desktop')

sha512sums=('c4ce84946072a8d5531f7dcae3dad7d0e730b12868392e4a7d05e43011eebcbc0c8d263f95ec12e9a815065f23c158f60f943eb13dd184b30d38cee63863d894'
            '683922d5ce90116ca04fbf1a244da87296beaf079ecde94d799b2d303e21dfda4e771f5a4b724e7dd64143feaef49d2f11fd2eaf380ebdcf02e9db82c9975497')

package() {
    cd ${srcdir}/IPMIView_${pkgver}_build.${_pkghash}_bundleJRE_Linux_x64

    # Remove bundled jre
    rm -rf jre/

    mkdir -p ${pkgdir}/opt/${pkgname}
    mkdir -p ${pkgdir}/usr/bin
    mkdir -p ${pkgdir}/usr/share/applications

    cp -rf . ${pkgdir}/opt/${pkgname}

    touch ${pkgdir}/opt/${pkgname}/timeout.properties
    touch ${pkgdir}/opt/${pkgname}/account.properties
    touch ${pkgdir}/opt/${pkgname}/email.properties
    touch ${pkgdir}/opt/${pkgname}/IPMIView.properties
    chmod a+rw ${pkgdir}/opt/${pkgname}/timeout.properties
    chmod a+rw ${pkgdir}/opt/${pkgname}/account.properties
    chmod a+rw ${pkgdir}/opt/${pkgname}/email.properties
    chmod a+rw ${pkgdir}/opt/${pkgname}/IPMIView.properties

    ln -s /opt/${pkgname}/IPMIView20 ${pkgdir}/usr/bin/${pkgname}
    install -m 0644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/"
}
