# Maintainer: SandaruKasa <sandarukasa plus aur at ya dot ru>
# Contributor: handsomexdd1024
# Based upon orphaned 'jdk-jetbrains' by Travis Weir <tweirtx at gmail dot com>

pkgname=jdk21-jetbrains-bin
_major=21
_minor=0.8
_build=1038.68
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
sha512sums=('d943d9e6cd90f617448b839be2015e9aba499cd659d256c7fb568320717603afb048bbca80a63c5f1d09916ea3a0380c8da17f0adcd5634c5b0aa88e1417207c')

package() {
  find . -exec chmod g+r,o+r {} +
  mkdir -p "${pkgdir}"/usr/lib/jvm
  cp -a "${_basename}" "${pkgdir}""${_prefix}"
  ln -sf /etc/ssl/certs/java/cacerts "${pkgdir}""${_prefix}"/lib/security/cacerts
}
