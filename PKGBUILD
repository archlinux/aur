#Contributor: onny <onny@project-insanity.org>
#Maintainer: Dominik Heidler <dominik@heidler.eu>

pkgname=openecardapp
pkgver=1.2.4
_jarver="${pkgver}-20171212-0958"
pkgrel=3
pkgdesc="Open eCard-App (opencard) is an open source alternative of the AusweisApp"
arch=('any')
url="https://www.openecard.org"
license=("GPL3")
depends=('java-runtime' 'pcsclite')
noextract=("richclient-${_jarver}.jar" "cifs-${_jarver}.jar")
source=("https://jnlp.openecard.org/richclient-${_jarver}.jar" "https://jnlp.openecard.org/cifs-${_jarver}.jar")
sha256sums=('d91e7902e81fc70c0b065f03284940bf943580f9f4185bcb72f093fb35f470b2'
            '394fcf87049fe7c62a661e626f7ac85efb8b7195bdec900fe2daf8d1a9308865')

# code for building from source
#makedepends=('maven' 'jdk8-openjdk')
#source=("$pkgname-$pkgver.tar.gz::https://codeload.github.com/ecsec/open-ecard/tar.gz/$pkgver" "openecardapp")
#prepare() {
#	cd "${srcdir}/open-ecard-${pkgver}/clients/richclient"
#	ln -s ../../../src/package src/
#}
#
#build() {
#	cd "${srcdir}/open-ecard-${pkgver}/clients/richclient"
#	mvn clean install
#}
#
#package() {
#	install -D -m755 "openecardapp" "${pkgdir}/usr/bin/openecardapp"
#	#cd "${srcdir}/open-ecard-${pkgver}/clients/richclient/target"
#	#install -D -m644 "richclient-${pkgver}-bundle-cifs.jar" "${pkgdir}/usr/share/java/openecardapp/OpeneCardApp.jar"
#}

prepare() {
	cd "$srcdir"
	echo "#!/bin/sh" > openecardapp
	echo "" >> openecardapp
	echo "cd /usr/share/java/openecardapp/" >> openecardapp
	echo "exec \"\$JAVA_HOME/bin/java\" -cp richclient-${_jarver}.jar:cifs-${_jarver}.jar org.openecard.richclient.RichClient" >> openecardapp
}

package() {
	cd "$srcdir"
	install -D -m755 "openecardapp" "${pkgdir}/usr/bin/openecardapp"
	install -D -m644 "richclient-${_jarver}.jar" "${pkgdir}/usr/share/java/openecardapp/richclient-${_jarver}.jar"
	install -D -m644 "cifs-${_jarver}.jar" "${pkgdir}/usr/share/java/openecardapp/cifs-${_jarver}.jar"
}
