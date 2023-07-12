# Maintainer: SandaruKasa <sandarukasa plus aur at ya dot ru>
# Contributor: handsomexdd1024
# Based upon orphaned 'jdk-jetbrains' by Travis Weir <tweirtx at gmail dot com>

pkgname=jdk17-jetbrains-bin
_major=17
_minor=0.7
_build=1000.6
_prefix="/usr/lib/jvm/java-${_major}-jetbrains"
pkgver="${_major}.${_minor}b${_build}"
pkgrel=2
pkgdesc='OpenJDK development kit with some fixes and enhancements by JetBrains'
arch=('x86_64')
url="https://github.com/JetBrains/JetBrainsRuntime/releases"
license=('GPL2')
depends=( 'java-runtime-common'          'ca-certificates-java'              'java-environment-common' )
provides=("java-runtime=$_major"         "java-runtime-headless=$_major"     "java-environment=$_major"
          "java-runtime-openjdk=$_major" "java-runtime-headless-jre=$_major" "java-environment-openjdk=$_major")
replaces=('intellij-jdk' 'jdk-jetbrains')
_basename="jbrsdk_jcef-${_major}.${_minor}-linux-x64-b${_build}"
_zipname="${_basename}.tar.gz"
source=("${_zipname}::https://cache-redirector.jetbrains.com/intellij-jbr/${_zipname}")
sha512sums=('749275b18bb1e196f96d7f9ce41b63ed7d5a4c68f5e3078f9f6fff49a5dbeb7e0a7e0f9f5a4bb2e63635f4da84e7fe1a4cd66c8d40a71a7704051b1fc46c29ef')

package() {
  find . -exec chmod g+r,o+r {} +
  mkdir -p "${pkgdir}"/usr/lib/jvm
  cp -a "${_basename}" "${pkgdir}""${_prefix}"
  ln -sf /etc/ssl/certs/java/cacerts "${pkgdir}""${_prefix}"/lib/security/cacerts
}
