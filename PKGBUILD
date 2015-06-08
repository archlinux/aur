# Contributor: nblock <nblock [/at\] archlinux DOT us>
# Maintainer: nblock <nblock [/at\] archlinux DOT us>

pkgname=jasperstarter
pkgver=3.0.0
pkgrel=2
pkgdesc='Running JasperReports from command line'
arch=('any')
url='http://jasperstarter.sourceforge.net'
license=('apache')
depends=('java-runtime')
source=(http://downloads.sourceforge.net/project/$pkgname/JasperStarter-${pkgver:0:-2}/${pkgname}-${pkgver}-bin.tar.bz2)
sha1sums=('6db56f1bb1e0e04861ec200c18e354efcf8e8386')
sha256sums=('38490b0a8a1c09be53d264289eaa2892a8c13583102cbcfd6d2cdb4ca7bcf5c3')

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
