# Maintainer: Estela ad Astra <i@estela.cn>

pkgbase=bishengjdk-17
pkgname=('bishengjdk-17' 'bishengjre-17')
pkgver=17.0.3
_majorver=${pkgver//.*/}
pkgrel=1
pkgdesc="BiSheng JDK is a high-performance OpenJDK distribution for production environments."
arch=('x86_64' 'aarch64')
url='https://gitee.com/openeuler/bishengjdk-17'
license=('GPL2')

case "${CARCH}" in
x86_64) PKGARCH='x64' ;;
aarch64) PKGARCH='aarch64' ;;
esac

source=("https://mirrors.huaweicloud.com/kunpeng/archive/compiler/bisheng_jdk/bisheng-jdk-$pkgver-linux-$PKGARCH.tar.gz"
    "https://mirrors.huaweicloud.com/kunpeng/archive/compiler/bisheng_jdk/bisheng-jre-$pkgver-linux-$PKGARCH.tar.gz")
sha256sums=('SKIP' 'SKIP')

package_bishengjdk-17() {
    depends=("java-environment-common" "java-runtime-common")
    provides=("java-environment=${_majorver}"
        "java-environment-bishengjdk=${_majorver}"
        "java-runtime=${_majorver}"
        "java-runtime-bishengjdk=${_majorver}"
        "java-runtime-headless=${_majorver}"
        "java-runtime-headless-bishengjdk=${_majorver}")
    install=bishengjdk.install
    _src=bisheng-jdk-$pkgver
    _dst=bishengjdk-$_majorver
    install -dm 755 "${pkgdir}/usr/lib/jvm/$_dst"
    cp -a ${srcdir}/$_src/* ${pkgdir}/usr/lib/jvm/$_dst
}

package_bishengjre-17() {
    depends=("java-runtime-common")
    provides=("java-runtime=${_majorver}"
        "java-runtime-bishengjdk=${_majorver}"
        "java-runtime-headless=${_majorver}"
        "java-runtime-headless-bishengjdk=${_majorver}")
    install=bishengjre.install
    _src=bisheng-jre-$pkgver
    _dst=bishengjre-$_majorver
    install -dm 755 "${pkgdir}/usr/lib/jvm/$_dst"
    cp -a ${srcdir}/$_src/* ${pkgdir}/usr/lib/jvm/$_dst
}
