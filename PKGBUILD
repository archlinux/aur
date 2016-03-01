# Contributor: fnord0 <fnord0 AT riseup DOT net>

pkgname=paros
pkgver=3.2.13
pkgrel=2
pkgdesc="Java-based HTTP/HTTPS proxy for assessing web app vulnerabilities. Supports editing/viewing HTTP messages on-the-fly, spiders, client certificates, proxy-chaining, intelligent scanning for XSS and SQLi, etc."
arch=('any')
url="http://www.parosproxy.org"
license=('GPL2')
depends=('java-runtime')
source=("http://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}-${pkgver}-unix.zip")
md5sums=('41233a331b9f951ee40fc140074d30c0')
sha1sums=('7343e25ef125be4000832e117df9d7209a86142a')


package() {
  install -d ${pkgdir}/usr/share/${pkgname} || return 1
  install -d ${pkgdir}/usr/share/${pkgname}/doc || return 1
  install -d ${pkgdir}/usr/share/licenses/${pkgname} || return 1
  install -d ${pkgdir}/usr/bin || return 1
  cd ${srcdir}/${pkgname}
  install -Dm644 release.txt ${pkgdir}/usr/share/${pkgname}/doc/release.txt || return 1
  cp -pR * ${pkgdir}/usr/share/${pkgname}/ || return 1
  cp -p ${pkgdir}/usr/share/${pkgname}/license/* ${pkgdir}/usr/share/licenses/${pkgname}/ || return 1

  #create startup app
	echo "#!/bin/sh" > ${pkgdir}/usr/bin/${pkgname}
  echo "cd /usr/share/paros" >> ${pkgdir}/usr/bin/${pkgname}
	echo "\$JAVA_HOME/bin/java" -jar '/usr/share/paros/paros.jar' >> ${pkgdir}/usr/bin/${pkgname}
  echo "cd -" >> ${pkgdir}/usr/bin/${pkgname}
	chmod +x ${pkgdir}/usr/bin/${pkgname}

}

# vim:set ts=2 sw=2 noet:

