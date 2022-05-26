# Contributor: nblock <nblock [/at\] archlinux DOT us>
# Maintainer: nblock <nblock [/at\] archlinux DOT us>

pkgname=jasperstarter
pkgver=3.6.2
pkgrel=1
pkgdesc='Running JasperReports from command line'
arch=('any')
url='http://jasperstarter.cenote.de/'
license=('apache')
depends=('java-runtime')
source=(https://downloads.sourceforge.net/project/$pkgname/JasperStarter-${pkgver:0:-2}/${pkgname}-${pkgver}-bin.tar.bz2)
sha1sums=('5b598c5d02734a0f1337962c181bf77a9f47551a')
sha256sums=('4a60536006ee1de0fba14f4fd022676590a53eaa8db8494466ec0b66e2aadf0e')

package() {
	cd "$srcdir/$pkgname"

	# Install java stuff to /usr/share/java/$pkgname
	mkdir -p $pkgdir/usr/share/java/$pkgname/{lib,jdbc}
	install -m644 lib/*.jar $pkgdir/usr/share/java/$pkgname/lib
	install -m644 jdbc/README $pkgdir/usr/share/java/$pkgname/jdbc

	# Examples, upstream docs and various other files
	mkdir -p $pkgdir/usr/share/doc/$pkgname
	cp -dr --preserve=mode,timestamp examples $pkgdir/usr/share/doc/$pkgname
	cp -dr --preserve=mode,timestamp docs $pkgdir/usr/share/doc/$pkgname
	install -m644 {CHANGES,NOTICE,README.md} "${pkgdir}/usr/share/doc/${pkgname}/"

	# Create startup file
	mkdir -p $pkgdir/usr/bin
	echo "#!/bin/sh" > ${pkgdir}/usr/bin/${pkgname}
	echo "exec /usr/bin/java -jar '/usr/share/java/jasperstarter/lib/jasperstarter.jar' \"\$@\"" >> ${pkgdir}/usr/bin/${pkgname}
	chmod +x ${pkgdir}/usr/bin/${pkgname}
}

# vim:set ts=2 sw=2 noet:
