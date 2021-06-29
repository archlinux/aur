# Maintainer: Frederik Schwan <freswa at archlinux dot org>

pkgname=jdk-jetbrains
_major=11
_minor=0.11
_build=1504.5
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
b2sums=('a6c5ef54fc859bf1effb6759704924fb93b2d56f42cac4a56b2ff9f1f29f847448f46dac3215a277e4c272dcfab65edc21b8ed92d9b32290a0360a1586ac0868')

package() {
  find . -exec chmod g+r,o+r {} +
  mkdir -p "${pkgdir}"/usr/lib/jvm
  cp -a jbrsdk "${pkgdir}"/usr/lib/jvm/${pkgname}
  ln -sf /etc/ssl/certs/java/cacerts "${pkgdir}"/usr/lib/jvm/${pkgname}/lib/security/cacerts
}
