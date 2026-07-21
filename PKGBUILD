# Maintainer: Marcel Joss <marceljoss@hotmail.ch>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: M A <morealaz at gmail dot com>

pkgname='java-openjdk-bin'
_majorver='26'
_fullver="${_majorver}.0.2"
_buildver='10'
_hash='818d462d89b645c7a1aad49066c454e5'
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
sha256sums_x86_64=('2da09e9db53e5c4f9eeec045f49e7d8fbcd8e4153edbf0c269f520ff82fd4198')
sha256sums_aarch64=('0ce6516c459e635d9f263f9b3492d83ec2c1ee26db128a6d904cae3d3096ceee')
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
