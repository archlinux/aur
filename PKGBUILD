# Maintainer: Antonio Bartalesi <antonio.bartalesi@gmail.com>

_name="Jive"
pkgname=${_name,,}
pkgver=7.40
_jarfile="${_name}-${pkgver}-jar-with-dependencies.jar"
pkgrel=1
pkgdesc="A standalone JAVA application designed to browse and edit the static TANGO database"
arch=('any')
url="https://gitlab.com/tango-controls/${_name}"
license=('GPL3')
depends=('java-runtime=8' jdk8-openjdk sh)
makedepends=(maven)
source=(
  https://gitlab.com/tango-controls/${pkgname}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz
  launcher
)
sha256sums=(
  'cef6231584770b09369f8d0bf1bb85aed2b579e56e218b432687eb2d5492cfdd'
  'be94be7e0794c84c6011ebda88adfc1dfce911beaa8aec55f66b4b226ee4b6d7'
)

prepare() {
  sed -i "s/jar_file/$_jarfile/" launcher
  sed -i "s/package_name/$pkgname/" launcher
}

build() {
  cd ${pkgname}-${pkgver}
  mvn package
}

package() {
  install -D -m755 ${srcdir}/${pkgname}-${pkgver}/target/${_jarfile} ${pkgdir}/usr/share/java/${pkgname}/${_jarfile}
  
  install -D -m755 ${srcdir}/launcher ${pkgdir}/usr/bin/${pkgname}
}
