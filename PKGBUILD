# Maintainer: nblock <nblock [/at\] archlinux DOT us>
# Contributor: xduugu

pkgname=baralga
_pkgname=${pkgname/b/B}
pkgver=1.8.3
pkgrel=1
pkgdesc="A simple and lightweight time tracking solution for freelancers and consultants"
arch=('any')
url="http://baralga.github.com"
license=('LGPL3')
depends=('java-runtime')
options=(emptydirs)
source=(https://github.com/${_pkgname}/${pkgname}/releases/download/v${pkgver}/${_pkgname}-Portable-${pkgver}.zip)
sha512sums=('a786ead107f075b56e0f0965e603a9eaacf6bab541094d5d0707dd396e1a1b28708a96eef2bbf5338a1fc2c6c725ee5da5bc774cf1c1db56618ea12c775bac77')

package() {
	cd "${srcdir}/${_pkgname}-${pkgver//_/-}"

	mkdir -p "${pkgdir}/usr/bin"
	install -d "${pkgdir}/usr/share/${pkgname}/"{lib,data}
	install -m644 "${_pkgname}-${pkgver//_/-}.jar" "${pkgdir}/usr/share/${pkgname}/${pkgname}.jar"
	#ignore contents of data/ for now ...

	#create startup file
	echo "#!/bin/sh" > ${pkgdir}/usr/bin/${pkgname}
	echo "exec \$JAVA_HOME/bin/java -jar /usr/share/${pkgname}/${pkgname}.jar \$@" >> ${pkgdir}/usr/bin/${pkgname}
	chmod +x ${pkgdir}/usr/bin/${pkgname}
}

# vim:set ts=2 sw=2 noet:
