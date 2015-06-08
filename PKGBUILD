# Maintainer: nblock <nblock [/at\] archlinux DOT us>
# Contributor: xduugu

pkgname=baralga
_pkgname=${pkgname/b/B}
pkgver=1.7.6
pkgrel=1
pkgdesc="A simple and lightweight time tracking solution for freelancers and consultants"
arch=('any')
url="http://baralga.github.com"
license=('LGPL3')
depends=('java-runtime')
options=(emptydirs)
source=(https://github.com/${_pkgname}/${pkgname}/releases/download/v${pkgver}/${_pkgname}-Portable-${pkgver}.zip)
md5sums=('3c5de56ec9c0bf3c54248f19a507565e')

package() {
  cd "${srcdir}/${_pkgname}-${pkgver//_/-}"

  mkdir -p "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/share/${pkgname}/"{lib,data}
  install -m644 "${_pkgname}-${pkgver//_/-}.jar" "${pkgdir}/usr/share/${pkgname}/${pkgname}.jar"
  install -m644 lib/* "${pkgdir}/usr/share/${pkgname}/lib/"
  #ignore contents of data/ for now ...

	#create startup file
  echo "#!/bin/sh" > ${pkgdir}/usr/bin/${pkgname}
  echo "exec \$JAVA_HOME/bin/java -jar /usr/share/${pkgname}/${pkgname}.jar \$@" >> ${pkgdir}/usr/bin/${pkgname}
  chmod +x ${pkgdir}/usr/bin/${pkgname}
}

# vim:set ts=2 sw=2 noet:
