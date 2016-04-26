#Contributor: onny <onny@project-insanity.org>
#Maintainer: Dominik Heidler <dominik@heidler.eu>

pkgname=openecardapp
pkgver=1.2.0
pkgrel=1
pkgdesc="Open eCard-App (opencard) is an open source alternative of the AusweisApp"
arch=('any')
url="https://www.openecard.org"
license=("GPL3")
depends=('java-runtime' 'pcsclite')
makedepends=('maven')
source=("$pkgname-$pkgver.tar.gz::https://codeload.github.com/ecsec/open-ecard/tar.gz/$pkgver" "openecardapp")
sha256sums=('7b8987ae7a8f088ea9b991b46e2690042d4e8640d9e1ffd8c2b4f8ef5160eb2c'
            '57996ed4c29221efc903a64038217ac4ec67e00950f99dd421ac0fef3b770d74')

build() {
	cd "${srcdir}/open-ecard-${pkgver}/clients/richclient"
	mvn clean install
}

package() {
	install -D -m755 "openecardapp"               "${pkgdir}/usr/bin/openecardapp"
	cd "${srcdir}/open-ecard-${pkgver}/clients/richclient/target"
	install -D -m644 "richclient-${pkgver}-bundle-cifs.jar" "${pkgdir}/usr/share/java/openecardapp/OpeneCardApp.jar"
}
