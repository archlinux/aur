# Maintainer: Antonio Bartalesi <antonio.bartalesi@gmail.com>
_name="Astor"
pkgname=${_name,,}
pkgver=7.5.1
_jarfile="Astor-${pkgver}-jar-with-dependencies.jar"
pkgrel=1
pkgdesc="A graphical Tango control system administration tool"
arch=('any')
url="https://gitlab.com/tango-controls/${_name}"
license=('GPL3')
depends=('java-runtime=8' sh)
source=(
  https://repo1.maven.org/maven2/org/tango-controls/${_name}/${pkgver}/${_jarfile}
  ${pkgname}
)
sha256sums=(
  '9ec0e788297f36c69f19bbd6987aeacb900f2c231058f833f0abb238364ce8ad'
  '25cc409561647519ad0bb2ffc00abb9cd923626f978f49c03b1f72b1fcd47d0b'
)

prepare() {
  sed -i "s/jar_file/$_jarfile/" ${pkgname}
}

package() {
  cd ${srcdir}
  install -D -m755 ${srcdir}/${_jarfile} ${pkgdir}/usr/share/java/${pkgname}/${_jarfile}
  
  install -D -m755 ${srcdir}/${pkgname} ${pkgdir}/usr/bin/${pkgname}
}
