# Maintainer: Ricardo Gonçalves <ricardompgoncalves@gmail.com>

pkgname=ecity
pkgver=1.5.1
pkgrel=1
pkgdesc="Virtual City Environment for Engineering Problem Based Learning"
arch=('i686' 'x86_64')
url="http://ecity-project.eu"
license=('GPL')
depends=()
source=("http://ecity-project.eu/${pkgname}-${pkgver}-linux.zip"
	"${pkgname}.desktop")
md5sums=('140ba9db9ac7042a8312c9b449a40d5b'
         'b22d47c4787a9e15e96c9fcf1b733848')

package() {
	# Create directories	
	mkdir -pv "${pkgdir}/opt/${pkgname}"
	mkdir -pv "${pkgdir}/usr/bin"
	mkdir -pv "${pkgdir}/usr/share/applications/"
	
	# Move files
	cp "${pkgname}.desktop" "${pkgdir}/usr/share/applications/"
	cp "${pkgname}-${pkgver}_Data/Resources/UnityPlayer.png" "${pkgdir}/opt/${pkgname}/${pkgname}.png"
	mv "${pkgname}-${pkgver}_Data" "${pkgdir}/opt/${pkgname}/"
	mv "${pkgname}-${pkgver}.x86" "${pkgdir}/opt/${pkgname}/"
	
	# Create links
	ln -sv "/opt/${pkgname}/${pkgname}-${pkgver}.x86" "${pkgdir}/opt/${pkgname}/${pkgname}"
	
	echo \#\!/bin/sh > "${pkgdir}/opt/${pkgname}/${pkgname}.sh"
	echo "/opt/${pkgname}/${pkgname}" >> "${pkgdir}/opt/${pkgname}/${pkgname}.sh"
	chmod a+x "${pkgdir}/opt/${pkgname}/${pkgname}.sh"
	ln -sv "/opt/${pkgname}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
}

