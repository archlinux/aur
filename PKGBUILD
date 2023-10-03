# Maintainer: Kirill Pshenichnyi <pshcyrill@mail.ru>
# Contributor: The Tango Controls community
#              (https://tango-controls.org) <info@tango-controls.org>

pkgname=tango-jtango
_pkgname=JTango
pkgver=9.7.2
_subver=9.7.1
pkgrel=1
pkgdesc="TANGO kernel Java implementation."
arch=('x86_64' 'armv7h')
url="https://www.tango-controls.org/"
license=('GPL3')
groups=('tango-controls')
depends=('jdk11-openjdk' 'maven')
conflicts=('tango')
source=("https://gitlab.com/tango-controls/${_pkgname}/-/archive/${pkgver}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('6bbbb17a8f858a698fdbe0265973f34c344b2f0e920bddfeefcfc987bbe33391')

_java_home='/usr/lib/jvm/java-11-openjdk/'
_install_path='/usr/share/java'

build() {
  cd "$srcdir/$_pkgname-$pkgver/"
  JAVA_HOME=$_java_home mvn package
}

package() {
  cd "$srcdir/$_pkgname-$pkgver/"

  install -Dm 644 "${srcdir}/${_pkgname}-${pkgver}/assembly/target/JTango-${_subver}-SNAPSHOT.jar" \
	  "${pkgdir}${_install_path}/JTango-${_subver}.jar"
  ln -s "${_install_path}/JTango-${_subver}.jar" "${pkgdir}${_install_path}/JTango.jar"

  install -Dm 644 "${srcdir}/${_pkgname}-${pkgver}/dao/target/TangORB-${_subver}-SNAPSHOT.jar" \
	  "${pkgdir}${_install_path}/TangORB-${_subver}.jar"
  ln -s "${_install_path}/TangORB-${_subver}.jar" "${pkgdir}${_install_path}/TangORB.jar"

  install -Dm 644 "${srcdir}/${_pkgname}-${pkgver}/common/target/JTangoCommons-${_subver}-SNAPSHOT.jar" \
	  "${pkgdir}${_install_path}/JTangoCommons-${_subver}.jar"
  ln -s "${_install_path}/JTangoCommons-${_subver}.jar" "${pkgdir}${_install_path}/JTangoCommons.jar"

  install -Dm 644 "${srcdir}/${_pkgname}-${pkgver}/client/target/JTangoClientLang-${_subver}-SNAPSHOT.jar" \
	  "${pkgdir}${_install_path}/JTangoClientLang-${_subver}.jar"
  ln -s "${_install_path}/JTangoClientLang-${_subver}.jar" "${pkgdir}${_install_path}/JTangoClientLang.jar"

  install -Dm 644 "${srcdir}/${_pkgname}-${pkgver}/server/target/JTangoServer-${_subver}-SNAPSHOT.jar" \
	  "${pkgdir}${_install_path}/JTangoServer-${_subver}.jar"
  ln -s "${_install_path}/JTangoServer-${_subver}.jar" "${pkgdir}${_install_path}/JTangoServer.jar"
}
