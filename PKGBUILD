# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: M A <morealaz at gmail dot com>

pkgname=java-openjdk-bin
_majorver=14.0.2
_buildver=12
pkgver=${_majorver}b${_buildver}
pkgrel=1
pkgdesc="Java OpenJDK ${_majorver} Oracle Build."
arch=('x86_64')
url="https://jdk.java.net/14"
license=('GPL2')
depends=('java-environment-common' 'java-runtime-common' 'ca-certificates-utils' 'nss')
conflicts=('jre-openjdk' 'jre-openjdk-headless' 'jdk-openjdk')
provides=(
    "java-environment=${_majorver}" 
    "java-environment-openjdk=${_majorver}"
    "java-runtime=${_majorver}" 
    "java-runtime-openjdk=${_majorver}"
    "java-runtime-headless=${_majorver}"
    "java-runtime-headless-openjdk=${_majorver}"
)
source=("openjdk-${_majorver}_${_buildver}_linux-x64_bin.tar.gz::https://download.java.net/java/GA/jdk${_majorver}/205943a0976c4ed48cb16f1043c5c647/${_buildver}/GPL/openjdk-${_majorver}_linux-x64_bin.tar.gz")
sha256sums=('91310200f072045dc6cef2c8c23e7e6387b37c46e9de49623ce0fa461a24623d')

_jvmdir=usr/lib/jvm/java-${_majorver}-openjdk

package() {
    # Install
    install -d "${pkgdir}/${_jvmdir}"
    cd jdk-${_majorver}
    cp -a bin include jmods lib release "${pkgdir}/${_jvmdir}/"
    # Link JKS keystore from ca-certificates-utils
    rm -f "${pkgdir}/${_jvmdir}/lib/security/cacerts"
    ln -sf /etc/ssl/certs/java/cacerts "${pkgdir}/${_jvmdir}/lib/security/cacerts"
    # Legal
    install -d "${pkgdir}/usr/share/licenses/java${_majorver}-openjdk"
    cp -a legal "${pkgdir}/usr/share/licenses/java${_majorver}-openjdk/"
    ln -s /usr/share/licenses/java${_majorver}-openjdk "${pkgdir}/${_jvmdir}/legal"
    # Conf
    install -d "${pkgdir}/etc"
    cp -r conf "${pkgdir}/etc/java${_majorver}-openjdk"
    ln -s /etc/java${_majorver}-openjdk "${pkgdir}/${_jvmdir}/conf"
}
# vim:set ts=4 sw=4 et:
