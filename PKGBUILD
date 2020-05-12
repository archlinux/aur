# Maintainer: Frederik Schwan <freswa at archlinux dot org>

pkgname=jdk-jetbrains
_major=11
_minor=0.7
_build=911.1
pkgver=${_major}.${_minor}b${_build}
pkgrel=1
pkgdesc='OpenJDK development kit with some fixes and enhancements by JetBrains'
arch=('x86_64')
url="https://bintray.com/jetbrains/intellij-jbr"
license=('GPL2')
depends=( 'java-runtime-common'          'ca-certificates-java'              'java-environment-common' )
provides=("java-runtime=$_major"         "java-runtime-headless=$_major"     "java-environment=$_major"
          "java-runtime-openjdk=$_major" "java-runtime-headless-jre=$_major" "java-environment-openjdk=$_major")
replaces=('intellij-jdk' 'jdk-jetbrains')
_zipname="jbrsdk-${_major}_${_minor//./_}-linux-x64-b${_build}.tar.gz"
source=("${_zipname}::https://bintray.com/jetbrains/intellij-jbr/download_file?file_path=${_zipname}")
b2sums=('70d9c015fd23a4805c52636c8948a2b0d9b7ca866a53637b54da57b489b90fa82eff83916491822cf40b00df17fde7bcf80fea51cca07e46cf731eef753256f1')

package() {
  find . -exec chmod g+r,o+r {} +
  mkdir -p "${pkgdir}"/usr/lib/jvm
  cp -a jbrsdk "${pkgdir}"/usr/lib/jvm/${pkgname}
  ln -sf /etc/ssl/certs/java/cacerts "${pkgdir}"/usr/lib/jvm/${pkgname}/lib/security/cacerts
}
