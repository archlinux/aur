# Maintainer: Marcel Joss <marceljoss@hotmail.ch>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: M A <morealaz at gmail dot com>

pkgname='java-openjdk-bin'
_majorver='16'
_fullver='16.0.1'
_buildver='9'
pkgver="${_fullver}.u${_buildver}"
pkgrel=1
pkgdesc="Java OpenJDK ${_fullver} Oracle Build."
arch=('x86_64')
url="https://jdk.java.net/16"
license=('GPL2')
depends=('java-environment-common' 'java-runtime-common' 'ca-certificates-utils' 'nss')
conflicts=("jre-openjdk>=${_majorver}" "jre-openjdk-headless>=${_majorver}" "jdk-openjdk>=${_majorver}")
provides=(
    "java-environment=${_majorver}" 
    "java-environment-openjdk=${_majorver}"
    "java-runtime=${_majorver}" 
    "java-runtime-openjdk=${_majorver}"
    "java-runtime-headless=${_majorver}"
    "java-runtime-headless-openjdk=${_majorver}"
)
source=("https://download.java.net/java/GA/jdk${_fullver}/7147401fd7354114ac51ef3e1328291f/${_buildver}/GPL/openjdk-${_fullver}_linux-x64_bin.tar.gz")
sha256sums=('b1198ffffb7d26a3fdedc0fa599f60a0d12aa60da1714b56c1defbce95d8b235')

_jvmdir="usr/lib/jvm/java-${_majorver}-openjdk"

package() {
    # Install
    install -d "${pkgdir}/${_jvmdir}"
    cd jdk-${_fullver}
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
