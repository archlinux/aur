# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: M A <morealaz at gmail dot com>

pkgname=java-openjdk-bin
_majorver=14.0.1
_buildver=7
pkgver=${_majorver}b${_buildver}
pkgrel=1
pkgdesc="Java OpenJDK ${_majorver} Oracle Build."
arch=('x86_64')
url="http://jdk.java.net/${_majorver}"
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
source=("openjdk-${_majorver}_${_buildver}_linux-x64_bin.tar.gz::https://download.java.net/java/GA/jdk${_majorver}/664493ef4a6946b186ff29eb326336a2/${_buildver}/GPL/openjdk-${_majorver}_linux-x64_bin.tar.gz")
sha256sums=('22ce248e0bd69f23028625bede9d1b3080935b68d011eaaf9e241f84d6b9c4cc')

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
