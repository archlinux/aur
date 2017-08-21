#Contributor: onny <onny@project-insanity.org>
#Maintainer: Dominik Heidler <dominik@heidler.eu>

pkgname=openecardapp
pkgver=1.2.4
_jarver="${pkgver}-20161024-1455"
pkgrel=1
pkgdesc="Open eCard-App (opencard) is an open source alternative of the AusweisApp"
arch=('any')
url="https://www.openecard.org"
license=("GPL3")
depends=('jre8-openjdk' 'pcsclite')
noextract=("richclient-${_jarver}.jar" "cifs-${_jarver}.jar")
source=("https://jnlp.openecard.org/richclient-${_jarver}.jar" "https://jnlp.openecard.org/cifs-${_jarver}.jar")
sha256sums=('2768fd0a0fdc1eab5531f72e72221c30301b6978dd599cb1dd278df4edd98684'
            'acefa03ac2e97b5d7dcdc2eba754dea0a66fe3499b952d89913586c62fefd513')

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
