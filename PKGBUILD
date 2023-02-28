# Maintainer: Antonio Bartalesi <antonio.bartalesi@gmail.com>

_name="Pogo"
pkgname=tango-${_name,,}
pkgver=9.8.3
_jarfile="${_name}-${pkgver}-SNAPSHOT.jar"
pkgrel=1
pkgdesc="The TANGO code generator. It allows to define a TANGO class model"
arch=('any')
url="https://gitlab.com/tango-controls/${_name}"
license=('GPL3')
depends=('java-runtime=11' jdk11-openjdk sh)
makedepends=(maven)
source=(
  https://gitlab.com/tango-controls/${_name,,}/-/archive/${pkgver}/${_name,,}-${pkgver}.tar.gz
  launcher
)
sha256sums=(
  '7cff020f2f250da4bb02e7da56d8f98f9bdc38618ca13ad9f455b049402c47f0'
  'ac00d9dd4e3ed83af078296585b3201f03b0c0a2c0b23fe1705ce3abe648a713'
)

prepare() {
  sed -i "s/jar_file/$_jarfile/" launcher
  sed -i "s/package_name/$pkgname/" launcher
}

build() {
  cd ${_name,,}-${pkgver}/fr.esrf.tango.pogo.parent
  mvn package
}

package() {
  install -D -m755 ${srcdir}/${_name,,}-${pkgver}/org.tango.pogo.pogo_gui/target/${_jarfile} ${pkgdir}/usr/share/java/${pkgname}/${_jarfile}
  install -D -m755 ${srcdir}/launcher ${pkgdir}/usr/bin/${pkgname}
}
