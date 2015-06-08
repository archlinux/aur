# Maintainer: Daniel Nagy <danielnagy at gmx de>
# Contributor: Kosenko Roman <madkite@gmail.com>

pkgname=findbugs
pkgver=3.0.1
pkgrel=1
pkgdesc='Bugs Finder for Java Programs'
url='http://findbugs.sourceforge.net'
arch=('any')
depends=('java-environment' 'bash')
makedepends=('apache-ant' 'java-environment')
license=('LGPL')
source=(http://prdownloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}-source.zip ${pkgname}.profile)

build() {
  cd "${srcdir}"
  [ ! -d ${pkgname}-${pkgver} ] && unzip -q ${pkgname}-${pkgver}-source.zip
  cd ${pkgname}-${pkgver}
  #[ -z "${JAVA_HOME}" ] && . /etc/profile.d/jdk.sh
  #sed 's|\(<fileset dir="\${etc.dir}" includes="\)\(\*\.xml"/>\)|\1messages\2|' -i build.xml
  find -type f -exec chmod 644 '{}' \;
  ant
}

package() {
  cd "${srcdir}"/${pkgname}-${pkgver}
  . "${srcdir}"/${pkgname}.profile
  mkdir -p "${pkgdir}"/${FINDBUGS_HOME}/src
  rm -f bin/*.bat
  cp -R bin "${pkgdir}"/${FINDBUGS_HOME}
  #cp -R doc "${pkgdir}"/${FINDBUGS_HOME}
  rm -f lib/*Apple* lib/*.icns lib/.ignorethis lib/junit.jar
  cp -R lib "${pkgdir}"/${FINDBUGS_HOME}
  cp -R plugin "${pkgdir}"/${FINDBUGS_HOME}
  cp -R src/xsl "${pkgdir}"/${FINDBUGS_HOME}/src
  install -m755 -D "${srcdir}"/${pkgname}.profile "${pkgdir}"/etc/profile.d/${pkgname}.sh
}

md5sums=('f50f22210b2d880bab570954a47e26ba'
         'f5d707cad9a69f209211430ec691e86b')
