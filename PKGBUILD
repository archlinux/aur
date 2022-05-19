# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=grasscutter-git
pkgver=1.1.2.45d18bc
_pkgname=Grasscutter
_commit=45d18bc1b6f59b769f1378868e8ffa8c442f5be7
pkgrel=1
pkgdesc="A server software reimplementation for a certain anime game."
arch=('any')
url="https://github.com/Grasscutters/Grasscutter"
license=('AGPL3')
provides=('grasscutter')
conflicts=('grasscutter')
depends=('java-runtime')
makedepends=('jdk17-openjdk')
source=("${pkgname}-${pkgver}.tgz::${url}/archive/${_commit}.tar.gz"
        "grasscutter-run")
b2sums=("064c69ff0cbc6a830ed89aea0dbd65cef62ee4a16de6d8b8fcc4d055db1e8cfcfeb81a7e14ddb54ff9be31f17f0410c2b22baf9bb59afaa8f712d3a6d15254e0"
        "6d3465934da9cedd11c6e0998caf812abbbcf9e4174df55a3cb7f7c6e2ec661567fdf8e89d2c2d031db2962c41ec7bcda04aca29adc6de285ec7c995b3c25bbd")

build() {
  cd "${_pkgname}-${_commit}"
  ./gradlew clean jar
}

package() {
  _pkgname_lower=$(echo "${_pkgname}" | tr '[:upper:]' '[:lower:]')
  install -Dm755 "grasscutter-run" "${pkgdir}/usr/bin/${_pkgname_lower}"
  cd "${_pkgname}-${_commit}"
  _path=$(echo ./*.jar)
  install -Dm644 $_path "${pkgdir}/usr/share/java/${_pkgname_lower}/${_pkgname_lower}.jar"
}
