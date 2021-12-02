# Maintainer: Travis Weir <tweirtx at gmail dot com>

pkgname=jdk-jetbrains
_major=11
_minor=0.13
_build=1751.19
pkgver=${_major}.${_minor}b${_build}
pkgrel=1
pkgdesc='OpenJDK development kit with some fixes and enhancements by JetBrains'
arch=('x86_64')
url="https://confluence.jetbrains.com/display/JBR/Release+notes+and+builds"
license=('GPL2')
depends=( 'java-runtime-common'          'ca-certificates-java'              'java-environment-common' )
provides=("java-runtime=$_major"         "java-runtime-headless=$_major"     "java-environment=$_major"
          "java-runtime-openjdk=$_major" "java-runtime-headless-jre=$_major" "java-environment-openjdk=$_major")
replaces=('intellij-jdk' 'jdk-jetbrains')
_zipname="jbrsdk-${_major}_${_minor//./_}-linux-x64-b${_build}.tar.gz"
source=("${_zipname}::https://cache-redirector.jetbrains.com/intellij-jbr/${_zipname}")
b2sums=('d1c5b208c0922dc46e83301d5282091003f51b51fe032cb8be1d2f68961f1690bde6d23e0e9caca629a6b410566b787d400060651d786539750b8704c749ee25')

package() {
  find . -exec chmod g+r,o+r {} +
  mkdir -p "${pkgdir}"/usr/lib/jvm
  cp -a jbrsdk "${pkgdir}"/usr/lib/jvm/${pkgname}
  ln -sf /etc/ssl/certs/java/cacerts "${pkgdir}"/usr/lib/jvm/${pkgname}/lib/security/cacerts
}
