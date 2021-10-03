#Maintainer: René Wagner <rwa at clttr dot info>
#Contributor: smrqdt <smrqdt@posteo.de>
#Contributor: onny <onny@project-insanity.org>
#Contributor: Dominik Heidler <dominik@heidler.eu>

pkgname=openecardapp
pkgver=1.4.5
pkgrel=1
pkgdesc="An open source alternative of the AusweisApp"
arch=('any')
url="https://www.openecard.org"
license=("GPL3")
depends=('java-runtime' 'pcsclite')
source=("https://github.com/ecsec/open-ecard/releases/download/${pkgver}/open-ecard-app_${pkgver}-1_amd64.deb")
install="openecardapp.install"
sha256sums=('435de73c6497eaea1771b6ae32c7c366c39cbcbe008e929a59f69ae15b119a39')

prepare() {
	cd "$srcdir"
	echo "#!/bin/sh" > openecardapp
	echo "" >> openecardapp
	echo "cd /opt/open-ecard-app/" >> openecardapp
	echo "/opt/open-ecard-app/bin/open-ecard-app \$@" >> openecardapp
}

package() {
	cd "$srcdir"
	install -D -m755 "openecardapp" "${pkgdir}/usr/bin/openecardapp"
	install -dm755 "${pkgdir}/opt/" 
	tar xJf data.tar.xz --strip-components 2 -C "${pkgdir}/opt/" 
}
