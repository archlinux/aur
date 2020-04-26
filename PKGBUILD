# Maintainer: Frederik Schwan <freswa at archlinux dot org>

pkgname=jdk8-jetbrains
_major=8
_minor=242
_build=1644.3
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
b2sums=('e807893182ef06686addefa56fd1b48e3ddea1fc017398594c0d8d80755657e135567bbd04e2b11869453727af6b378c11a37a2fa071dbcb15ee48394d73f975')

package() {
  find . -exec chmod g+r,o+r {} +
  install -dm755 "${pkgdir}"/usr/lib/jvm/${pkgname}
  cp -a {bin,include,jre,lib} "${pkgdir}"/usr/lib/jvm/${pkgname}
  ln -sf /etc/ssl/certs/java/cacerts "${pkgdir}"/usr/lib/jvm/${pkgname}/jre/lib/security/cacerts
}
