pkgname=ipmiview
pkgver=2.13.1
_pkgname=IPMIView
_pkgrev=171024
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
source_i686=("ftp://ftp.supermicro.com/utility/IPMIView/Linux/${_pkgname}_${pkgver}_build.${_pkgrev}_bundleJRE_Linux.tar.gz")
source_x86_64=("ftp://ftp.supermicro.com/utility/IPMIView/Linux/${_pkgname}_${pkgver}_build.${_pkgrev}_bundleJRE_Linux_x64.tar.gz")

sha256sums=('41d5fa089912ee10d476a0f6aa3c12765861c1a71cf4f811efaf2e47c4ce9351')
sha256sums_x86_64=('2d25b117b29e159cdd4db3fc341b8e977edde49613fddcb778849f3e1ee4ca80')
sha256sums_i686=('70a17737ac202da00a64ae79f58687dff94d1efd06d090969aae784ebabdce02')

package() {
    cd ${srcdir}/${_pkgname}_${pkgver}_build.${_pkgrev}_bundleJRE_Linux${_pkgarch}

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
