# Maintainer : Ahmed Moselhi <ahmedmoselhi55@gmail.com>

# Build notes:
# https://phoenicisorg.github.io/phoenicis/Users/build/

pkgname=phoenicis-playonlinux
_pkgname=phoenicis
pkgver=5.0_snapshot
_pkgver=5.0-snapshot
pkgrel=3
pkgdesc="Phoenicis PlayOnLinux allows you to install and use non-native applications on linux"
arch=('any')
url="https://github.com/PhoenicisOrg/phoenicis.git"
license=('LGPL3')
makedepends=('maven' 'java-environment-openjdk=11' 'git')
depends=('cabextract' 'curl' 'icoutils' 'imagemagick'
         'p7zip' 'unzip' 'wget' 'wine' 'xterm')
options=(!strip)
commit="9f4d518c42a919a97fa6b027641f9c0dd1857681"
source=("$pkgname-${commit}.zip::https://github.com/PhoenicisOrg/${_pkgname}/archive/$commit.zip")
sha256sums=('SKIP')

build() {
  cd "${_pkgname}-$commit"
  if test -d "/usr/lib/jvm/java-11-openjdk"; then
    export JAVA_HOME="/usr/lib/jvm/java-11-openjdk"
  elif test -d "/usr/lib/jvm/java-11-jdk11"; then
    export JAVA_HOME="/usr/lib/jvm/java-11-jdk11"
  elif test -d "/usr/lib/jvm/java-11-adoptopenjdk"; then
    export JAVA_HOME="/usr/lib/jvm/java-11-adoptopenjdk"
  fi
  mvn clean package
  cd phoenicis-dist/src/scripts
  bash phoenicis-create-package.sh
}

package() {
  cd "${_pkgname}-$commit/phoenicis-dist/target/Phoenicis_5.0-SNAPSHOT"
  cp -a usr "${pkgdir}"
}
