# Maintainer: Kirill Pshenichnyi <pshcyrill@mail.ru>
# Contributor: The Tango Controls community
#              (https://tango-controls.org) <info@tango-controls.org>

pkgname=tango-jtango
_pkgname=JTango
pkgver=9.6.8
pkgrel=1
pkgdesc="TANGO kernel Java implementation."
arch=('x86_64' 'armv7h')
url="https://www.tango-controls.org/"
license=('GPL3')
groups=('tango-controls')
depends=('jdk11-openjdk' 'maven')
conflicts=('tango')
source=("https://gitlab.com/tango-controls/${_pkgname}/-/archive/${pkgver}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('64928e1dd38ea80a2b873737599b400dba7469c581bfb07e017a21c8bafe5ab7')

_java_home='/usr/lib/jvm/java-11-openjdk/'
_install_path='/usr/share/java'

build() {
  cd "$srcdir/$_pkgname-$pkgver/"
  JAVA_HOME=$_java_home mvn package
}

package() {
  cd "$srcdir/$_pkgname-$pkgver/"

  install -Dm 644 "${srcdir}/${_pkgname}-${pkgver}/assembly/target/JTango-${pkgver}-SNAPSHOT.jar" \
	  "${pkgdir}${_install_path}/JTango-${pkgver}.jar"
  ln -s "${_install_path}/JTango-${pkgver}.jar" "${pkgdir}${_install_path}/JTango.jar"

  install -Dm 644 "${srcdir}/${_pkgname}-${pkgver}/dao/target/TangORB-${pkgver}-SNAPSHOT.jar" \
	  "${pkgdir}${_install_path}/TangORB-${pkgver}.jar"
  ln -s "${_install_path}/TangORB-${pkgver}.jar" "${pkgdir}${_install_path}/TangORB.jar"

  install -Dm 644 "${srcdir}/${_pkgname}-${pkgver}/common/target/JTangoCommons-${pkgver}-SNAPSHOT.jar" \
	  "${pkgdir}${_install_path}/JTangoCommons-${pkgver}.jar"
  ln -s "${_install_path}/JTangoCommons-${pkgver}.jar" "${pkgdir}${_install_path}/JTangoCommons.jar"

  install -Dm 644 "${srcdir}/${_pkgname}-${pkgver}/client/target/JTangoClientLang-${pkgver}-SNAPSHOT.jar" \
	  "${pkgdir}${_install_path}/JTangoClientLang-${pkgver}.jar"
  ln -s "${_install_path}/JTangoClientLang-${pkgver}.jar" "${pkgdir}${_install_path}/JTangoClientLang.jar"

  install -Dm 644 "${srcdir}/${_pkgname}-${pkgver}/server/target/JTangoServer-${pkgver}-SNAPSHOT.jar" \
	  "${pkgdir}${_install_path}/JTangoServer-${pkgver}.jar"
  ln -s "${_install_path}/JTangoServer-${pkgver}.jar" "${pkgdir}${_install_path}/JTangoServer.jar"
}
