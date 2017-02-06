# Maintainer: Roberto Valentini <valantin89[at]gmail[dot]com>

pkgname=ipmiview
pkgver=2.12.0
_pkgname=IPMIView
_pkgrev=160804
pkgrel=1
pkgdesc="Supermicro IPMI tool"
makedepends=('tar')
depends=("glibc" "java-runtime=8")
arch=('x86_64')
license=('custom:"Super Micro Computer"')
url="http://www.supermicro.com/products/nfo/ipmi.cfm"
source=("ftp://ftp.supermicro.com/utility/IPMIView/Linux/${_pkgname}_${pkgver}_build.${_pkgrev}_bundleJRE_Linux_x64.tar.gz"
        "ipmiview.desktop")

sha256sums=('787a060413451a4a5993c31805f55a221087b7199bbaf20e9fe1254e2a76db42'
            '41d5fa089912ee10d476a0f6aa3c12765861c1a71cf4f811efaf2e47c4ce9351')

package() {
    # IPMIView_2.12.0_build.160804_bundleJRE_Linux_x64
    cd ${srcdir}/${_pkgname}_${pkgver}_build.${_pkgrev}_bundleJRE_Linux_x64

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
