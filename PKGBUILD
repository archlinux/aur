# Maintainer: luckdragon <f41c0r [/at\] hack DOT ink>

pkgname=testsslserver
pkgver=1.0
pkgrel=1
pkgdesc="A script to test TLS/SSL servers for CRIME, BEAST, and other issues."
url="http://www.bolet.org/TestSSLServer/"
depends=('java-runtime')
arch=('any')
license=('MIT')
noextract=("${pkgname}.jar")
source=("${pkgname}.jar::http://www.bolet.org/TestSSLServer/TestSSLServer.jar"
        LICENSE)
md5sums=('ceececde5204be3eca4ee45390f854df'
         '9e6efa0007a424c6190c5eeab78b2555')

package() {
  mkdir -p ${pkgdir}/usr/bin
  mkdir -p ${pkgdir}/usr/share/{${pkgname},licenses/${pkgname}}

  cd ${srcdir}
  install -m644 ${pkgname}.jar ${pkgdir}/usr/share/${pkgname}/${pkgname}.jar
  install -m644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/

  # Create startup file for burpsuite.
  echo "#!/bin/sh" > ${pkgdir}/usr/bin/TestSSLServer
  echo "exec \$JAVA_HOME/bin/java -jar /usr/share/${pkgname}/${pkgname}.jar \$@" >> ${pkgdir}/usr/bin/TestSSLServer
  chmod +x ${pkgdir}/usr/bin/TestSSLServer
}

# vim:set ts=2 sw=2 et:
