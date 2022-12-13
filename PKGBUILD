# Maintainer: nblock <nblock [/at\] archlinux DOT us>
# Contributor: xduugu

pkgname=baralga
_pkgname=${pkgname/b/B}
pkgver=1.9.9
pkgrel=1
pkgdesc="A simple and lightweight time tracking solution for freelancers and consultants"
arch=('any')
url="http://baralga.github.com"
license=('LGPL3')
depends=('java-runtime')
options=(emptydirs)
source=(https://github.com/${_pkgname}/${pkgname}/releases/download/v${pkgver}/${_pkgname}-Portable-v${pkgver}.zip)
sha512sums=('a3531a80ce539b11046ce7ada031ba9612ff6c8ccb1bb898df4a3ed8efb56d6a1c7e66db09c64a5579c45cc26d890cb7a04a89fb55ab8335885db28d253de228')

package() {
	cd "${srcdir}/${_pkgname}-v${pkgver//_/-}"

	mkdir -p "${pkgdir}/usr/bin"
	install -d "${pkgdir}/usr/share/${pkgname}/"{lib,data}
	install -m644 "${_pkgname}-v${pkgver//_/-}.jar" "${pkgdir}/usr/share/${pkgname}/${pkgname}.jar"
	#ignore contents of data/ for now ...

	#create startup file
	echo "#!/bin/sh" > ${pkgdir}/usr/bin/${pkgname}
	echo "exec \$JAVA_HOME/bin/java -jar /usr/share/${pkgname}/${pkgname}.jar \$@" >> ${pkgdir}/usr/bin/${pkgname}
	chmod +x ${pkgdir}/usr/bin/${pkgname}
}

# vim:set ts=2 sw=2 noet:
