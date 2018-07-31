# Maintainer: nblock <nblock [/at\] archlinux DOT us>
# Contributor: DigitalPathogen <aur@digitalpathogen.co.uk>
# Contributor: daronin
# Contributor: kageurufu

pkgname=burpsuite
pkgver=1.7.36
pkgrel=1
pkgdesc="An integrated platform for performing security testing of web applications (free edition)."
url="https://portswigger.net/burp/"
depends=('java-runtime')
arch=('any')
license=('custom')
noextract=("${pkgname}-${pkgver}.jar")
source=("${pkgname}-${pkgver}.jar::https://portswigger.net/Burp/Releases/Download?productId=100&version=${pkgver}&type=Jar"
        LICENSE
        burpsuite.desktop
        icon64.png)

sha1sums=('446c268ae6e59db54e902d34a130e7cbf5a411ae'
          '5c78bd9cfce70fe9cba679a88bef9cc9bdf19146'
          'c87e811ff37d63e5a206516967926b3d6e4e991f'
          'fbd3e7d3e70d817d017899ed71bc69ae7066804c')

package() {
  mkdir -p ${pkgdir}/usr/bin
  mkdir -p ${pkgdir}/usr/share/{applications,pixmaps,${pkgname},licenses/${pkgname}}

  cd ${srcdir}
  install -m644 ${pkgname}-${pkgver}.jar ${pkgdir}/usr/share/${pkgname}/${pkgname}.jar
  install -m644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/
  install -m644 burpsuite.desktop ${pkgdir}/usr/share/applications/
  install -m644 icon64.png ${pkgdir}/usr/share/pixmaps/burpsuite.png

  # Create startup file for burpsuite.
  echo "#!/bin/sh" > ${pkgdir}/usr/bin/${pkgname}
  echo "exec \$JAVA_HOME/bin/java -jar /usr/share/burpsuite/burpsuite.jar \$@" >> ${pkgdir}/usr/bin/${pkgname}
  chmod +x ${pkgdir}/usr/bin/${pkgname}
}

# vim:set ts=2 sw=2 et:
