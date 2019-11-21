# Maintainer : Thanos Apostolou <thanosapostolou@outlook.com>

# Build notes:
# https://phoenicisorg.github.io/phoenicis/Users/build/

pkgname=phoenicis-playonlinux
_pkgname=phoenicis
pkgver=5.0_alpha2
_pkgver=5.0-alpha.2
pkgrel=3
pkgdesc="Phoenicis PlayOnLinux allows you to install and use non-native applications on linux"
arch=('any')
url="https://www.phoenicis.org/"
license=('LGPL3')
makedepends=('maven' 'java-environment-openjdk=11')
depends=('cabextract' 'curl' 'icoutils' 'imagemagick'
         'java-runtime-openjdk=11' 'java11-openjfx'
         'p7zip' 'unzip' 'wget' 'wine' 'xterm')
options=(!strip)
source=("git+https://github.com/PhoenicisOrg/${_pkgname}.git#commit=4a5e61e850ed616fa4db1d1bbbd57c9229c0ce3c")
sha256sums=('SKIP')

prepare() {
  cd "${_pkgname}"
  export JAVA_HOME="/usr/lib/jvm/java-11-openjdk"
}

build() {
  cd "${_pkgname}"
  mvn -DskipTests clean package
  cd phoenicis-dist/src/scripts
  bash phoenicis-create-package.sh
}

package() {
  cd "${_pkgname}/phoenicis-dist/target/Phoenicis_5.0-SNAPSHOT"
  cp -a usr "${pkgdir}"
}
