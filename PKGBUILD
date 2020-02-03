#Contributor: smrqdt <smrqdt@posteo.de>
#Contributor: onny <onny@project-insanity.org>
#Maintainer: Dominik Heidler <dominik@heidler.eu>

pkgname=openecardapp
pkgver=1.4.1
pkgrel=1
pkgdesc="An open source alternative of the AusweisApp"
arch=('any')
url="https://www.openecard.org"
license=("GPL3")
depends=('java-runtime' 'pcsclite')
source=("https://github.com/ecsec/open-ecard/releases/download/${pkgver}/open-ecard-app_${pkgver}_amd64.deb")
install="openecardapp.install"
sha256sums=('f83833a1242bb1b46e433aacbf3124da4019be74a781cb9c12187dfe77697664')

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
