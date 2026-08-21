# Maintainer: Marcel Joss <marceljoss@hotmail.ch>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: M A <morealaz at gmail dot com>

pkgname='java-openjdk-bin'
_majorver='26'
_fullver="${_majorver}.0.2.1"
_buildver='1'
_hash='3b8e6c7ec6274148a7aa15e7e7dfb53c'
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
sha256sums_x86_64=('a1489256029b389ce6ee52da0de1d01496c5df1776d6870241fe4823b998ea61')
sha256sums_aarch64=('b96b265a4a1a36c02454148891aa58ca63303cbc2d1b7979c33b4fe99e09117b')
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
    install -d "${pkgdir}/usr/share/licenses/java-openjdk-bin"
    cp -a legal "${pkgdir}/usr/share/licenses/java-openjdk-bin/"
    ln -s /usr/share/licenses/java-openjdk-bin "${pkgdir}/${_jvmdir}/legal"
    # Conf
    install -d "${pkgdir}/etc"
    cp -r conf "${pkgdir}/etc/java-openjdk-bin"
    ln -s /etc/java-openjdk-bin "${pkgdir}/${_jvmdir}/conf"
}
# vim:set ts=4 sw=4 et:
