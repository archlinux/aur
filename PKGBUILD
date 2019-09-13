# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>

pkgname=jdk-jetbrains
_major=11
_minor=0.4
_build=462.3
pkgver=${_major}.${_minor}b${_build}
pkgrel=2
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
sha256sums=('41db9190b1053bb0b3a408d117e52874f9e56982aafa0316f863d836634a9cc9')

package() {
    rm "${srcdir}/${_zipname}"
    find "${srcdir}" -exec chmod g+r,o+r {} +
    mkdir -p "${pkgdir}/usr/lib/jvm"
    cp -a "${srcdir}/jbrsdk" "${pkgdir}/usr/lib/jvm/${pkgname}"
    ln -sf /etc/ssl/certs/java/cacerts "${pkgdir}/usr/lib/jvm/${pkgname}/lib/security/cacerts"
}
