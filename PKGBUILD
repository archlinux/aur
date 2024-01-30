# Maintainer: SandaruKasa <sandarukasa plus aur at ya dot ru>
# Contributor: handsomexdd1024
# Based upon orphaned 'jdk-jetbrains' by Travis Weir <tweirtx at gmail dot com>

pkgname=jdk21-jetbrains-bin
_major=21
_minor=0.2
_build=346.3
_prefix="/usr/lib/jvm/java-${_major}-jetbrains"
pkgver="${_major}.${_minor}b${_build}"
pkgrel=1
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
sha512sums=('04e5f523eac017089c9664e23794a570c5e36250024b2c7c244f83e3e82a8aa12fae225450b74072af49074fc7ea58cd513d0ea8b7d2dc33b4442810906fc97b')

package() {
  find . -exec chmod g+r,o+r {} +
  mkdir -p "${pkgdir}"/usr/lib/jvm
  cp -a "${_basename}" "${pkgdir}""${_prefix}"
  ln -sf /etc/ssl/certs/java/cacerts "${pkgdir}""${_prefix}"/lib/security/cacerts
}
