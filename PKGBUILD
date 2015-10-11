# Maintainer: Marco <mcat95 [at] gmail [dot] com>
pkgname=aurous-bin
pkgver=0.1Alpha
pkgrel=2

pkgdesc="A music player built to serve your needs."
arch=(i686 x86_64)
url="https://aurous.me/"
license=('unknown')

depends=("jre8-openjdk" "java-openjfx" "gksu")

source_x86_64=(https://aurous.me/downloads/aurous-linux64.zip)
source_i386=(https://aurous.me/downloads/aurous-linux32.zip)
source=(Aurous.desktop)
md5sums=(e04b9770f59111250b4e9096d2cc9ecc)
md5sums_x86_64=(22b339794d9811b7deda7e43de60759e)
md5sums_i386=(b732c16edcc210af0351f829a85ec94f)

package() {
	cd "${srcdir}"
	echo "${pkgdir}/opt/${pkgname}/"

	install -d "${pkgdir}/opt/${pkgname}/"
	install -d "${pkgdir}/usr/bin"
	install -d "${pkgdir}/usr/share/applications"
	#Bin file	
	install -D "${srcdir}/Aurous.jar" "${pkgdir}/opt/${pkgname}/"
	#Data folders
	cp -a "${srcdir}/data" "${pkgdir}/opt/${pkgname}/"
	cp -a "${srcdir}/linux" "${pkgdir}/opt/${pkgname}/"
	#Fix executable
	chmod +x "${pkgdir}/opt/${pkgname}/linux/jxbrowser-chromium"
	#Path executable
	echo "cd /opt/${pkgname}" > ${pkgdir}/usr/bin/Aurous
	echo "gksudo -D Aurous 'java -jar /opt/${pkgname}/Aurous.jar'" >> ${pkgdir}/usr/bin/Aurous

	chmod +x "${pkgdir}/usr/bin/Aurous"

	#Desktop entry
	install "${srcdir}/Aurous.desktop" "${pkgdir}/usr/share/applications"
}
