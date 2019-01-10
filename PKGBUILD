#Contributor: smrqdt <smrqdt@posteo.de>
#Contributor: onny <onny@project-insanity.org>
#Maintainer: Dominik Heidler <dominik@heidler.eu>

pkgname=openecardapp
pkgver=1.3.0
pkgrel=1
pkgdesc="Open eCard-App (opencard) is an open source alternative of the AusweisApp"
arch=('any')
url="https://www.openecard.org"
license=("GPL3")
depends=('java-runtime' 'pcsclite')
source=("https://github.com/ecsec/open-ecard/releases/download/1.3.0/Open-eCard-App-${pkgver}.deb")
install="openecardapp.install"
md5sums=('268075f1b3a9f2ae1b8166f6942d418a')

prepare() {
	cd "$srcdir"
	echo "#!/bin/sh" > openecardapp
	echo "" >> openecardapp
	echo "cd /usr/share/java/openecardapp/" >> openecardapp
	echo "exec /opt/Open-eCard-App/Open-eCard-App \$@" >> openecardapp
}

package() {
	cd "$srcdir"
	install -D -m755 "openecardapp" "${pkgdir}/usr/bin/openecardapp"
	install -dm755 "${pkgdir}/opt/" 
	tar xJf data.tar.xz --strip-components 2 -C "${pkgdir}/opt/" 
}
