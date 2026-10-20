# Maintainer: Marcel Joss <marceljoss@hotmail.ch>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: M A <morealaz at gmail dot com>

pkgname='java-openjdk-bin'
_majorver='27'
_fullver="${_majorver}.0.1"
_buildver='9'
_hash='cb858dd9ef0246e1847750bdb65252fe'
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
sha256sums_x86_64=('5748965a78d06be35bec771284066bcc474dab4d672113e428d5df729c264613')
sha256sums_aarch64=('cfa802dd706ae23a85acec429a3801f2f5bf07748ec5ae62a61b2a61ae2f8832')
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
