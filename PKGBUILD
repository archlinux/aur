# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>

pkgname=jdk-jetbrains
_major=11
_minor=0.5
_build=562.2
pkgver=${_major}.${_minor}b${_build}
pkgrel=1
pkgdesc="OpenJDK development kit with some fixes and enhancements by JetBrains"
arch=('x86_64')
url="https://bintray.com/jetbrains/intellij-jbr"
license=('GPL2')
depends=( 'java-runtime-common'          'ca-certificates-java'              'java-environment-common' )
provides=("java-runtime=$_major"         "java-runtime-headless=$_major"     "java-environment=$_major"
          "java-runtime-openjdk=$_major" "java-runtime-headless-jre=$_major" "java-environment-openjdk=$_major")
replaces=('intellij-jdk' 'jdk-jetbrains')
_zipname="jbrsdk-${_major}_${_minor//./_}-linux-x64-b${_build}.tar.gz"
source=("${_zipname}::https://bintray.com/jetbrains/intellij-jbr/download_file?file_path=${_zipname}")
sha512sums=('07e4de02a5c5a85ce2e4cb30a4b605fd1147779638634e8c70cbd74a2aee884a41b7b3741b66b1567285ceec9429549be3eaccea317ca6b745b06eec77136fc2')

package() {
    rm "${srcdir}/${_zipname}"
    find "${srcdir}" -exec chmod g+r,o+r {} +
    mkdir -p "${pkgdir}/usr/lib/jvm"
    cp -a "${srcdir}/jbrsdk" "${pkgdir}/usr/lib/jvm/${pkgname}"
    ln -sf /etc/ssl/certs/java/cacerts "${pkgdir}/usr/lib/jvm/${pkgname}/lib/security/cacerts"
}
