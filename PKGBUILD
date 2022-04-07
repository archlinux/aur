#Maintainer: René Wagner <rwa at clttr dot info>
#Contributor: smrqdt <smrqdt@posteo.de>
#Contributor: onny <onny@project-insanity.org>
#Contributor: Dominik Heidler <dominik@heidler.eu>

pkgname=openecardapp
pkgver=1.4.10
pkgrel=1
pkgdesc="An open source alternative of the AusweisApp"
arch=('any')
url="https://www.openecard.org"
license=("GPL3")
depends=('java-runtime' 'pcsclite')
source=("https://github.com/ecsec/open-ecard/releases/download/${pkgver}/open-ecard-app_${pkgver}_amd64.deb")
install="openecardapp.install"
sha256sums=('9db4e1f13a748462782e0c2ea6a0fdb4d12f9adcbd996fc82bcae0889dbeaeaa')

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
