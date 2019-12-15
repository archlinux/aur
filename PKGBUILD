# Maintainer: Parker Johansen <johansen.parker@gmail.com>
pkgname=ballerina
pkgver=1.0.5
pkgrel=1
_pkg=${pkgname}-${pkgver}
pkgdesc="an open source programming language and platform for cloud-era application programmers to easily write software that just works"
arch=('any')
url="https://ballerina.io/"
license=('Apache')
depends=('jre8-openjdk')
optdepends=('docker' 'bash' 'kubectl' 'helm')
source=(${_pkg}.zip::https://product-dist.ballerina.io/downloads/${pkgver}/ballerina-${pkgver}.zip)
sha256sums=('dd2f4cb04dd09560e6d810b9d3a9e4de1c86d284f1767c319456535694ef26a0')

_licensedir=usr/share/licenses/${pkgname}
_docdir=usr/share/doc/${pkgname}
_appdir=usr/share/${pkgname}/${_pkg}
_bindir=usr/bin/

package() {
    install -dm755 ${pkgdir}/${_bindir}
    install -dm755 ${pkgdir}/${_appdir}
    install -dm755 ${pkgdir}/${_docdir}
    install -Dm755 ${srcdir}/${_pkg}/distributions/jballerina-${pkgver}/LICENSE ${pkgdir}/${_licensedir}/LICENSE
    install -Dm644 ${srcdir}/${_pkg}/distributions/jballerina-${pkgver}/README.md ${pkgdir}/${_docdir}/README.md
    cp -ar ${srcdir}/${_pkg}/distributions/jballerina-${pkgver}/docs/* ${pkgdir}/${_docdir}/
    cp -ar ${srcdir}/${_pkg}/* ${pkgdir}/${_appdir}/
    chmod -R a+r ${pkgdir}/${_appdir}/distributions/jballerina-${pkgver}/lib
    ln -sf /${_appdir}/bin/ballerina ${pkgdir}/usr/bin/ballerina
    ln -sf /usr/lib/jvm/java-8-openjdk ${pkgdir}/${_appdir}/dependencies/jdk8u202-b08-jre
}

