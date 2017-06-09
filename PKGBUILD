pkgname=ipmiview
pkgver=2.13.0
_pkgname=IPMIView
_pkgrev=170504
_pkgver=${_pkgver}_${_pkgrev}
pkgrel=1
pkgdesc="Supermicro IPMI tool"
makedepends=('tar')
depends=("glibc" "java-runtime=8")
arch=('x86_64' 'i686')
if [ "${CARCH}" = "x86_64" ]; then
    _pkgarch=x64
else
    _pkgarch=x32
fi
license=('custom:"Super Micro Computer"')
url="http://www.supermicro.com/products/nfo/ipmi.cfm"
source=("ftp://ftp.supermicro.com/utility/IPMIView/Linux/${_pkgname}_${pkgver}_build.${_pkgrev}_bundleJRE_Linux_${_pkgarch}.tar.gz"
        "ipmiview.desktop")
sha256sums=('c687d7c74eeb691033d0b5f75586fac82e03c5d6e20d66c1c37bbc4ecd2bdcc1'
            '41d5fa089912ee10d476a0f6aa3c12765861c1a71cf4f811efaf2e47c4ce9351')

package() {
    cd ${srcdir}/${_pkgname}_${pkgver}_build.${_pkgrev}_bundleJRE_Linux_${_pkgarch}

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
