# Maintainer: nblock <nblock [/at\] archlinux DOT us>
# Contributor: DigitalPathogen <aur@digitalpathogen.co.uk>
# Contributor: daronin
# Contributor: kageurufu

pkgname=burpsuite
pkgver=1.6.01
pkgrel=1
pkgdesc="Burp Suite is an integrated platform for attacking web applications (free edition)."
url="http://portswigger.net/burp/"
depends=('java-runtime')
arch=('any')
license=('custom')
noextract=("${pkgname}.jar")
source=("${pkgname}.jar::http://portswigger.net/burp/${pkgname}_free_v${pkgver}.jar"
        LICENSE
        burpsuite.desktop
        icon64.png)

md5sums=('6aa35f21ff8fc0094a7bb5b5f06e09ea'
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
