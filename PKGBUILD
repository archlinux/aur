# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>

pkgname=jdk8-jetbrains
_major=8
_minor=222
_build=1621.1
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
_zipname="jbrsdk-${_major}u${_minor//./_}-linux-x64-b${_build}.tar.gz"
source=("${_zipname}::https://bintray.com/jetbrains/intellij-jbr/download_file?file_path=${_zipname}")
sha256sums=('43a3af04c705933ba12ec9ebedac2afb2f7cf35785197bde4bb27baae4d0d131')

package() {
    rm "${srcdir}/${_zipname}"
    find "${srcdir}" -exec chmod g+r,o+r {} +
    mkdir -p "${pkgdir}/usr/lib/jvm"
    cp -a "${srcdir}/jbrsdk" "${pkgdir}/usr/lib/jvm/${pkgname}"
    ln -sf /etc/ssl/certs/java/cacerts "${pkgdir}/usr/lib/jvm/${pkgname}/lib/security/cacerts"
}
