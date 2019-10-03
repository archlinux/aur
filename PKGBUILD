# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>

pkgname=jdk-jetbrains
_major=11
_minor=0.4
_build=494.1
pkgver=${_major}.${_minor}b${_build}
pkgrel=1
pkgdesc="OpenJDK development kit with some fixes and enhancements by JetBrains"
arch=('x86_64')
url="https://bintray.com/jetbrains/intellij-jdk"
license=('GPL2')
depends=( 'java-runtime-common'          'ca-certificates-java'              'java-environment-common' )
provides=("java-runtime=$_major"         "java-runtime-headless=$_major"     "java-environment=$_major"
          "java-runtime-openjdk=$_major" "java-runtime-headless-jre=$_major" "java-environment-openjdk=$_major")
replaces=('intellij-jdk' 'jdk-jetbrains')
_zipname="jbrsdk-${_major}_${_minor//./_}-linux-x64-b${_build}.tar.gz"
source=("${_zipname}::https://bintray.com/jetbrains/intellij-jbr/download_file?file_path=${_zipname}")
sha512sums=('8f81e1efa8f7eee79e3f246b5f67f80b079661243721ce1464df12b0b7e14a6bd73883c27f1ef68716abc3e59a2d5b4fd9991b79b85b06abf9c8a308bc6e56ed')

package() {
    rm "${srcdir}/${_zipname}"
    find "${srcdir}" -exec chmod g+r,o+r {} +
    mkdir -p "${pkgdir}/usr/lib/jvm"
    cp -a "${srcdir}/jbrsdk" "${pkgdir}/usr/lib/jvm/${pkgname}"
    ln -sf /etc/ssl/certs/java/cacerts "${pkgdir}/usr/lib/jvm/${pkgname}/lib/security/cacerts"
}
