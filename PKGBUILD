pkgname=ipmiview
pkgver=2.15.0
_pkghash=190109
pkgrel=2
pkgdesc="Supermicro IPMI tool"
makedepends=('tar')
depends=("glibc" "java-runtime=8")
arch=('x86_64')
license=('custom:"Super Micro Computer"')
url="http://www.supermicro.com/products/nfo/ipmi.cfm"
source=("ipmiview.desktop")
source_x86_64=("https://www.supermicro.com/wftp/utility/IPMIView/Linux/IPMIView_${pkgver}_build.${_pkghash}_bundleJRE_Linux_x64.tar.gz")

sha256sums=('41d5fa089912ee10d476a0f6aa3c12765861c1a71cf4f811efaf2e47c4ce9351')
sha256sums_x86_64=('3314341589b22cf00792bc66ed309605d43eff708a1d09de7a4517d3852e5545')

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
