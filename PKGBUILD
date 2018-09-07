# $Id$
# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=java-openjdk-ea-bin
_majorver=11
_buildver=28
pkgver=${_majorver}b${_buildver}
pkgrel=1
pkgdesc="Java OpenJDK ${_majorver} Early-Access Build from Oracle."
arch=('x86_64')
url="http://jdk.java.net/${_majorver}"
license=('GPL2')
depends=('java-environment-common' 'ca-certificates-utils' 'nss')
provides=(
  "java-environment=${_majorver}" 
  "java-environment-openjdk=${_majorver}"
  "java-runtime=${_majorver}" 
  "java-runtime-openjdk=${_majorver}"
  "java-runtime-headless=${_majorver}"
  "java-runtime-headless-openjdk=${_majorver}"
)
source=("https://download.java.net/java/early_access/jdk${_majorver}/${_buildver}/GPL/openjdk-${_majorver}+${_buildver}_linux-x64_bin.tar.gz")
sha256sums=('3784cfc4670f0d4c5482604c7c513beb1a92b005f569df9bf100e8bef6610f2e')

_jvmdir=usr/lib/jvm/java-${_majorver}-openjdk-ea

package() {
  # Install
  install -d "${pkgdir}/${_jvmdir}"
  cd jdk-${_majorver}
  cp -a bin include jmods lib release "${pkgdir}/${_jvmdir}/"
  # Link JKS keystore from ca-certificates-utils
  rm -f "${pkgdir}/${_jvmdir}/lib/security/cacerts"
  ln -sf /etc/ssl/certs/java/cacerts "${pkgdir}/${_jvmdir}/lib/security/cacerts"
  # Legal
  install -d "${pkgdir}/usr/share/licenses/java${_majorver}-openjdk-ea"
  cp -a legal "${pkgdir}/usr/share/licenses/java${_majorver}-openjdk-ea/"
  ln -s /usr/share/licenses/java${_majorver}-openjdk-ea "${pkgdir}/${_jvmdir}/legal"
  # Conf
  install -d "${pkgdir}/etc"
  cp -r conf "${pkgdir}/etc/java${_majorver}-openjdk-ea"
  ln -s /etc/java${_majorver}-openjdk-ea "${pkgdir}/${_jvmdir}/conf"
}
# vim:set ts=2 sw=2 et:
