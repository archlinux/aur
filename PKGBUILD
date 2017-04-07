# Contributor: nblock <nblock [/at\] archlinux DOT us>
# Maintainer: nblock <nblock [/at\] archlinux DOT us>

pkgname=jasperstarter
pkgver=3.1.0
pkgrel=1
pkgdesc='Running JasperReports from command line'
arch=('any')
url='http://jasperstarter.sourceforge.net'
license=('apache')
depends=('java-runtime')
source=(http://downloads.sourceforge.net/project/$pkgname/JasperStarter-${pkgver:0:-2}/${pkgname}-${pkgver}-bin.tar.bz2)
sha1sums=('b96a1d4b20f92936823b3cea463de72352d4fbd2')
sha256sums=('1b9d08a0a0af88b9f2550e5f329d0a123c561adb7843738f9e6ad66db8618a67')

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
