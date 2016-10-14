#Contributor: onny <onny@project-insanity.org>
#Maintainer: Dominik Heidler <dominik@heidler.eu>

pkgname=openecardapp
pkgver=1.2.3
pkgrel=1
pkgdesc="Open eCard-App (opencard) is an open source alternative of the AusweisApp"
arch=('any')
url="https://www.openecard.org"
license=("GPL3")
depends=('java-runtime' 'pcsclite')
makedepends=('maven')
source=("$pkgname-$pkgver.tar.gz::https://codeload.github.com/ecsec/open-ecard/tar.gz/$pkgver" "openecardapp")
sha256sums=('787e974739bc6034b142034cf9d8fd3977b254a72c65a3ef1105bf575d33e89c'
            '57996ed4c29221efc903a64038217ac4ec67e00950f99dd421ac0fef3b770d74')

prepare() {
	cd "${srcdir}/open-ecard-${pkgver}/clients/richclient"
	ln -s ../../../src/package src/
}

build() {
	cd "${srcdir}/open-ecard-${pkgver}/clients/richclient"
	mvn clean install
}

package() {
	install -D -m755 "openecardapp"               "${pkgdir}/usr/bin/openecardapp"
	cd "${srcdir}/open-ecard-${pkgver}/clients/richclient/target"
	install -D -m644 "richclient-${pkgver}-bundle-cifs.jar" "${pkgdir}/usr/share/java/openecardapp/OpeneCardApp.jar"
}
