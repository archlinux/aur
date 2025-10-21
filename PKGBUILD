# Maintainer: Marcel Joss <marceljoss@hotmail.ch>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: M A <morealaz at gmail dot com>

pkgname='java-openjdk-bin'
_majorver='25'
_fullver="${_majorver}.0.1"
_buildver='8'
_hash='2fbf10d8c78e40bd87641c434705079d'
pkgver="${_fullver}.u${_buildver}"
pkgrel=1
pkgdesc="Java OpenJDK ${_fullver} Oracle Build."
arch=('x86_64' 'aarch64')
url="https://jdk.java.net/${_majorver}"
license=('GPL2')
depends=('java-environment-common' 'java-runtime-common' 'ca-certificates-utils' 'nss')
provides=(
    "java-environment=${_majorver}" 
    "java-environment-openjdk=${_majorver}"
    "java-runtime=${_majorver}" 
    "java-runtime-openjdk=${_majorver}"
    "java-runtime-headless=${_majorver}"
    "java-runtime-headless-openjdk=${_majorver}"
)
_sourcePrefix="https://download.java.net/java/GA/jdk${_fullver}/${_hash}/${_buildver}/GPL/openjdk-${_fullver}_linux-"
_sourceSuffix="_bin.tar.gz"
source_x86_64=("${_sourcePrefix}x64${_sourceSuffix}")
source_aarch64=("${_sourcePrefix}aarch64${_sourceSuffix}")
sha256sums_x86_64=('514db33011f2c81fa9c589f7712735b42b9d2575db8f817d3be40a92d2ef7ad8')
sha256sums_aarch64=('c5732ae191151195fbd2cfb7aef7675bf2c37cfa8bfd06f8330b6f04d4eb03a4')
_jvmdir="usr/lib/jvm/java-${_majorver}-openjdk-bin"

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
