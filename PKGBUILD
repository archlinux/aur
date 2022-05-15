# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=grasscutter-git
pkgver=1.1.2.2564fef
_pkgname=Grasscutter
_commit=2564fefe020863fdfb713f70d153d3cac3004565
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
b2sums=("a157a39cd9b20374b37bc22b7ab0badd3d8e106594da7103bff0bf5a17ed1674dffb893d545d9c643886ad5031227106a62a2db9bf64e0f8737ba73b7764030a"
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
