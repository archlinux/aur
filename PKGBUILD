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
sha512sums=(45e7b5f870241b81933ef77b0c40a3bca71495ad3dc1dadb2f296c272eda5b49c489e6155b91456184d75ebca27c7abc75e8e3443834aaba830a654594ab5792)
sha512sums_x86_64=(060b7147a5936ae5b66adc9236188e221eb904c8281f6f4e159f04453ece030008aad43ed295314a31ae05fd1272fef88c2237e281a3b0d0ae84e48d089d8d8a)
sha512sums_i386=(1aa42f149d1cefe4f74355722478cfdb5b3dc0dc72a4b629b0fe8609ce09bcf0d1e3e3c581b22d7509af0b698872fd1526cfa5792563e1ea487751946a2feaf0)

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
