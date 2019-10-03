# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>

pkgname=jdk8-jetbrains
_major=8
_minor=222
_build=1626.3
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
sha512sums=('18ef9e6c80879e54d1910277c5bd7f0d8f6fcceddd02f654af733a496c3485a8728d9afc33c7175fb5bc0591742fa5856f880659bb2ac9d1d10d0cba6da69df6')

package() {
    rm "${srcdir}/${_zipname}"
    find "${srcdir}" -exec chmod g+r,o+r {} +
    mkdir -p "${pkgdir}/usr/lib/jvm"
    cp -a "${srcdir}/jbrsdk" "${pkgdir}/usr/lib/jvm/${pkgname}"
    ln -sf /etc/ssl/certs/java/cacerts "${pkgdir}/usr/lib/jvm/${pkgname}/lib/security/cacerts"
}
