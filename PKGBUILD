pkgname=ipmiview
pkgver=2.14.0
_pkgname=IPMIView
_pkgrev=180213
_pkgver=${_pkgver}_${_pkgrev}
pkgrel=2
pkgdesc="Supermicro IPMI tool"
makedepends=('tar')
depends=("glibc" "java-runtime=8")
arch=('x86_64' 'i686')
if [ "${CARCH}" = "x86_64" ]; then
    _pkgarch=_x64
else
    _pkgarch=
fi
license=('custom:"Super Micro Computer"')
url="http://www.supermicro.com/products/nfo/ipmi.cfm"
source=("ipmiview.desktop")
source_i686=("https://www.supermicro.com/wftp/utility/IPMIView/Linux/${_pkgname}_${pkgver}_build.${_pkgrev}_bundleJRE_Linux.tar.gz")
source_x86_64=("https://www.supermicro.com/wftp/utility/IPMIView/Linux/${_pkgname}_${pkgver}_build.${_pkgrev}_bundleJRE_Linux_x64.tar.gz")

sha256sums=('41d5fa089912ee10d476a0f6aa3c12765861c1a71cf4f811efaf2e47c4ce9351')
sha256sums_x86_64=('90f08a8ccb38b4ccc048010dd93f73cc3360cc259331d08b589a567d2a17e2f2')
sha256sums_i686=('37b6d1deb21960a75b077b6b87c640c211276dbc0fc8f217cf48dfba460c918b')

package() {
    cd ${srcdir}/${_pkgname}_${pkgver}_build.${_pkgrev}_bundleJRE_Linux${_pkgarch}

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
