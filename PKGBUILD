# Maintainer: jooch <jooch at gmx dot com>
pkgname=jdk13-openjdk-bin
_majorver=13.0.1
_buildver=9
pkgver=${_majorver}b${_buildver}
pkgrel=1
pkgdesc="Java OpenJDK ${_majorver} Oracle Build."
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
conflicts=(
  "java-environment=${_majorver}" 
  "java-environment-openjdk=${_majorver}"
  "java-runtime=${_majorver}" 
  "java-runtime-openjdk=${_majorver}"
  "java-runtime-headless=${_majorver}"
  "java-runtime-headless-openjdk=${_majorver}"
)

source=("https://download.java.net/java/GA/jdk13.0.1/cec27d702aa74d5a8630c65ae61e4305/9/GPL/openjdk-13.0.1_linux-x64_bin.tar.gz")
sha256sums=('2e01716546395694d3fad54c9b36d1cd46c5894c06f72d156772efbcf4b41335')

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
# vim:set ts=2 sw=2 et:
