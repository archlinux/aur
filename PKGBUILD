# Maintainer: SandaruKasa <sandarukasa plus aur at ya dot ru>
# Contributor: handsomexdd1024
# Based upon orphaned 'jdk-jetbrains' by Travis Weir <tweirtx at gmail dot com>

pkgname=jdk17-jetbrains-bin
_major=17
_minor=0.6
_build=829.1
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
_basename="jbrsdk-${_major}.${_minor}-linux-x64-b${_build}"
_zipname="${_basename}.tar.gz"
source=("${_zipname}::https://cache-redirector.jetbrains.com/intellij-jbr/${_zipname}")
sha512sums=('779cf632a70e77143248f4b0149d8bd4ea4641164652043a8908aa7383001f78d273bab330ea68203c74f6d2016e885b9743ce440839acbe07c6d0b0de975dd9')

package() {
  find . -exec chmod g+r,o+r {} +
  mkdir -p "${pkgdir}"/usr/lib/jvm
  cp -a "${_basename}" "${pkgdir}""${_prefix}"
  ln -sf /etc/ssl/certs/java/cacerts "${pkgdir}""${_prefix}"/lib/security/cacerts
}
