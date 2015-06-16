# Contributor/Maintainer: ilikenwf/Matt Parnell <parwok@gmail.com>

pkgname=azsmrc
pkgver=1.0.0
pkgrel=4
pkgdesc="Remote control for Azureus/Vuze. You must have the plugin enabled in Azureus/Vuze to use this on a remote host."
arch=('i686' 'x86_64')
url="http://azsmrc.sourceforge.net/" 
depends=('java-environment')
makedepends=('unzip')
license=('GPL')
source=('http://downloads.sourceforge.net/azsmrc/AzSMRC_1.0.0.zip'
		'azsmrc.desktop'
		'azsmrc')
md5sums=('0f8a98ea8ad313074c2c4fd1d449e5e4'
         '6eded06bf3b4095ba0b230d011e61e59'
         '439484e023c44ae948c566404629f97b')
		
[ "$CARCH" = "x86_64" ] && source=('http://downloads.sourceforge.net/azsmrc/AzSMRC_1.0.0.zip'
								   'http://www.mattparnell.com/linux/azsmrc/swt_64.jar'
								   'azsmrc.desktop'
								   'azsmrc'
								   'azsmrc.png') \
						&& md5sums=('0f8a98ea8ad313074c2c4fd1d449e5e4'
									'6eded06bf3b4095ba0b230d011e61e59'
									'8ef4ba7fb63eeaf7080984ff05e7ef85'
									'439484e023c44ae948c566404629f97b'
									'5f3bf7631ae54b7f3c463a399cd62cfa')

build()
{
	cd ${srcdir}
	# SWT is not arch independent, so we have to do this annoying step...
	# Furthermore, it has to be the eclipse version of SWT to work
	# Rather than getting that zip and dealing with file replacements, we just use static
	[ "$CARCH" = "x86_64" ] && rm swt.jar && mv swt_64.jar swt.jar
}

package()
{

	mkdir ${pkgdir}/opt
	mkdir ${pkgdir}/opt/azsmrc/
	chmod 667 ${pkgdir}/opt/azsmrc/
	mkdir ${pkgdir}/usr/
	mkdir ${pkgdir}/usr/share
	mkdir ${pkgdir}/usr/share/pixmaps
	mkdir ${pkgdir}/usr/share/applications
	mkdir ${pkgdir}/usr/bin
	
	install -c AzSMRC_1.0.0.jar ${pkgdir}/opt/azsmrc/AzSMRC_1.0.0.jar
	install -c AzSMRCupdate.xml.gz ${pkgdir}/opt/azsmrc/AzSMRCupdate.xml.gz
	install -c commons-codec_1.3.jar ${pkgdir}/opt/azsmrc/commons-codec_1.3.jar
	install -c jdom_1.1.jar ${pkgdir}/opt/azsmrc/jdom_1.1.jar
	install -c launcher.jar ${pkgdir}/opt/azsmrc/launcher.jar
	install -c launch.properties ${pkgdir}/opt/azsmrc/launch.properties
	install -c log4j_1.2.13.jar ${pkgdir}/opt/azsmrc/log4j_1.2.13.jar
	install -c swt.jar ${pkgdir}/opt/azsmrc/swt.jar
	install -m555 -c azsmrc ${pkgdir}/usr/bin/azsmrc
	install -m644 azsmrc.desktop ${pkgdir}/usr/share/applications/azsmrc.desktop || return 1
	install -m644 azsmrc.png ${pkgdir}/usr/share/pixmaps/azsmrc.png || return 1
}
