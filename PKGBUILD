# Maintainer: Frederik Schwan <freswa at archlinux dot org>

pkgname=jdk8-jetbrains
_major=8
_minor=252
_build=1649.2
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
b2sums=('ce19c7db219f4f1fd6561178d452c765b4f72aa45e99985fec7f8baebad6612b794dff87951afa34c999c975c7c28165a2024e6e77778754a22cc99d2af01142')

package() {
  find . -exec chmod g+r,o+r {} +
  install -dm755 "${pkgdir}"/usr/lib/jvm/${pkgname}
  cp -a {bin,include,jre,lib} "${pkgdir}"/usr/lib/jvm/${pkgname}
  ln -sf /etc/ssl/certs/java/cacerts "${pkgdir}"/usr/lib/jvm/${pkgname}/jre/lib/security/cacerts
}
