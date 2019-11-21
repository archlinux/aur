# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>

pkgname=jdk8-jetbrains
_major=8
_minor=232
_build=1638.6
pkgver=${_major}.${_minor}b${_build}
pkgrel=1
pkgdesc='OpenJDK 8 development kit with some fixes and enhancements by JetBrains'
arch=('x86_64')
url="https://bintray.com/jetbrains/intellij-jbr"
license=('GPL2')
depends=( 'java-runtime-common'          'ca-certificates-java'              'java-environment-common' )
provides=("java-runtime=$_major"         "java-runtime-headless=$_major"     "java-environment=$_major"
          "java-runtime-openjdk=$_major" "java-runtime-headless-jre=$_major" "java-environment-openjdk=$_major")
replaces=('intellij-jdk' 'jdk-jetbrains')
_zipname="jbrsdk-${_major}u${_minor//./_}-linux-x64-b${_build}.tar.gz"
source=("${_zipname}::https://bintray.com/jetbrains/intellij-jbr/download_file?file_path=${_zipname}")
sha512sums=('710f47e1e8d26d21c5d27af603739a3d053fb5675a030eeb1bfa7311091bdc5f73b005f38c8ecf92a9b6890026fe475e7564aa0e64b4132ce5113d4863d96da4')

package() {
  find . -exec chmod g+r,o+r {} +
  install -dm755 "${pkgdir}"/usr/lib/jvm/${pkgname}
  cp -a {bin,include,jre,lib} "${pkgdir}"/usr/lib/jvm/${pkgname}
  ln -sf /etc/ssl/certs/java/cacerts "${pkgdir}"/usr/lib/jvm/${pkgname}/jre/lib/security/cacerts
}
