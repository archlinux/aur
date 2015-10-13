# Maintainer: Marco <mcat95 [at] gmail [dot] com>
pkgname=aurous-bin
pkgver=0.1Alpha
pkgrel=4

pkgdesc="A music player built to serve your needs. NOTE: If md5 fails simply flag the package as outdated"
arch=(i686 x86_64)
url="https://aurous.me/"
license=('unknown')

depends=("java-runtime=8" "java-openjfx" "gksu" "libgcrypt15")

source_x86_64=(https://aurous.me/downloads/aurous-linux64.zip)
source_i386=(https://aurous.me/downloads/aurous-linux32.zip)
source=(Aurous.desktop)
md5sums=(e04b9770f59111250b4e9096d2cc9ecc)
md5sums_x86_64=(fc6bf92831e18af8c11d272bcbaea777)
md5sums_i386=(e1deaba23c9b29319b5c55ec2d881d81)

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
