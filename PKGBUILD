# Maintainer: Antonio Bartalesi <antonio.bartalesi@gmail.com>
_name="Pogo"
pkgname=tango-${_name,,}
pkgver=9.8.2
_jarfile="${_name}-${pkgver}.jar"
pkgrel=1
pkgdesc="A standalone JAVA application designed to browse and edit the static TANGO database"
arch=('any')
url="https://gitlab.com/tango-controls/${_name}"
license=('GPL3')
depends=('java-runtime=11' sh)
source=(
  https://repo1.maven.org/maven2/org/tango-controls/${_name}/${pkgver}/${_jarfile}
  launcher
)
sha256sums=(
  'dca0d02ce7b4148369db401636486a152df650b07a9d4cc19b6b5ccc18e47cf9'
  'ac00d9dd4e3ed83af078296585b3201f03b0c0a2c0b23fe1705ce3abe648a713'
)

prepare() {
  sed -i "s/jar_file/$_jarfile/" launcher
  sed -i "s/package_name/$pkgname/" launcher
}

package() {
  cd ${srcdir}
  install -D -m755 ${srcdir}/${_jarfile} ${pkgdir}/usr/share/java/${pkgname}/${_jarfile}
  
  install -D -m755 ${srcdir}/launcher ${pkgdir}/usr/bin/${pkgname}
}
