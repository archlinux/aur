# Maintainer: nblock <nblock [/at\] archlinux DOT us>
# Contributor: DigitalPathogen <aur@digitalpathogen.co.uk>
# Contributor: daronin
# Contributor: kageurufu

pkgname=burpsuite
pkgver=1.7beta
pkgrel=1
pkgdesc="An integrated platform for performing security testing of web applications (free edition)."
url="https://portswigger.net/burp/"
depends=('java-runtime')
arch=('any')
license=('custom')
noextract=("${pkgname}.jar")
source=("${pkgname}.jar::https://portswigger.net/DownloadUpdate.ashx?Product=Free"
        LICENSE
        burpsuite.desktop
        icon64.png)

md5sums=('9851e2c48ce91e6e9b47b789aec50245'
         'f463acff8a409ef66136a30b404ff361'
         '81feb47df93ef9b65e5194cf9ff6c023'
         'c3678a3dcb77765beb6708a7cead6341')

package() {
  mkdir -p ${pkgdir}/usr/bin
  mkdir -p ${pkgdir}/usr/share/{applications,pixmaps,${pkgname},licenses/${pkgname}}

  cd ${srcdir}
  install -m644 ${pkgname}.jar ${pkgdir}/usr/share/${pkgname}/${pkgname}.jar
  install -m644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/
  install -m644 burpsuite.desktop ${pkgdir}/usr/share/applications/
  install -m644 icon64.png ${pkgdir}/usr/share/pixmaps/burpsuite.png

  # Create startup file for burpsuite.
  echo "#!/bin/sh" > ${pkgdir}/usr/bin/${pkgname}
  echo "exec \$JAVA_HOME/bin/java -jar /usr/share/burpsuite/burpsuite.jar \$@" >> ${pkgdir}/usr/bin/${pkgname}
  chmod +x ${pkgdir}/usr/bin/${pkgname}
}

# vim:set ts=2 sw=2 et:
