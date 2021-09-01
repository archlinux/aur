# Maintainer: Travis Weir <tweirtx at gmail dot com>

pkgname=jdk-jetbrains
_major=11
_minor=0.12
_build=1504.27
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
b2sums=('a2dad2a9b81c5f8e6a51d958d39a8b1571f2995c8e3f920c5608931513a5b7feefa961723bb1cf475e4ea325874623001fb8eca8d0049a822e336f80b5f37cab')

package() {
  find . -exec chmod g+r,o+r {} +
  mkdir -p "${pkgdir}"/usr/lib/jvm
  cp -a jbrsdk "${pkgdir}"/usr/lib/jvm/${pkgname}
  ln -sf /etc/ssl/certs/java/cacerts "${pkgdir}"/usr/lib/jvm/${pkgname}/lib/security/cacerts
}
