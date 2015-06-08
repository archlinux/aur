# Maintainer: Dea1993 <andrea.deangelis93@gmail.com>

pkgname=dmmediaconverter
pkgver=1.7.0
pkgrel=1
pkgdesc="a FFmpeg frontend (GUI) with video stream copy (pass-through) and other features"
arch=('i686' 'x86_64')
url="http://dmsimpleapps.blogspot.ro/2014/04/dmmediaconverter.html"
license=('custom')
depends=('gtk2' 'desktop-file-utils')
install="${pkgname}.install"
source=(
	"dmMediaConverter_v${pkgver}_linux_x86.tar.gz"::"https://drive.google.com/uc?id=0B1MiTYJef5a9cXdST0lDWkN1cTA"
	"license.zip"::"https://docs.google.com/document/d/1U2xjYwX4VMckRzWc0ol98arPGCb0oaPx6Rw6adRwTjo/export?format=zip"
	"license.txt"::"https://docs.google.com/document/d/1U2xjYwX4VMckRzWc0ol98arPGCb0oaPx6Rw6adRwTjo/export?format=txt"
	"${pkgname}.desktop"::"https://docs.google.com/uc?authuser=0&id=0B8AHSEMWV-pnOEJoeGNPNXBnZ0U&export=download"
	"${pkgname}.png"::"https://docs.google.com/uc?authuser=0&id=0B8AHSEMWV-pnTExiZnpkVHlleGc&export=download"
)
md5sums=(
	'a050c41b0dd56615d6670b43b0dcc675'
	'SKIP' 
	'16c60312c92ae94e0b2dbd801d4ebeb6'
	'9d88ba18721ca9114a25fa670cdb5ff1'
	'e76a2f880abad88751d2aa7f3d8c8a45'
)

if [ "$CARCH" = x86_64 ]; then
	source[0]="dmMediaConverter_v${pkgver}_linux_x64.tar.gz"::"https://www.mdonline.ro/FileHosting/Blogger/dmSimpleApps/dmMediaConverter/dmMediaConverter_v1.7.0_linux_x64.tar.gz"
	md5sums[0]='6b001c96c6fbea11128fad4c3e4cb360'
fi

package() {
	install -m 755 -d "${pkgdir}/usr/share/applications/${pkgname}"
	install -m 755 -t "${pkgdir}/usr/share/applications/${pkgname}" "${pkgname}.desktop"
	
	install -m 755 -d "${pkgdir}/usr/share/pixmaps/"
	install -m 644 -t "${pkgdir}/usr/share/pixmaps/" "${pkgname}.png"
	
	install -m 755 -d "${pkgdir}/usr/share/licenses/${pkgname}" 
	install -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "Licence_dmMediaConveter.html"
	install -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "license.txt"
	
	cd "${srcdir}/dmMediaConverter"
	
	install -m 755 -d "${pkgdir}/usr/lib/${pkgname}"	
	install -m 755 -t "${pkgdir}/usr/lib/${pkgname}" "dmMediaConverter"
	install -m 644 -t "${pkgdir}/usr/lib/${pkgname}" *.*
	
	if [ "$CARCH" = x86_64 ]; then
		install -m 755 -d "${pkgdir}/usr/lib/${pkgname}/bin/x86_64-linux"
		install -m 755 -t "${pkgdir}/usr/lib/${pkgname}/bin/x86_64-linux" bin/x86_64-linux/*
	else
		install -m 755 -d "${pkgdir}/usr/lib/${pkgname}/bin/x86_32-linux"
		install -m 755 -t "${pkgdir}/usr/lib/${pkgname}/bin/x86_32-linux" bin/x86_32-linux/*
	fi
	
	install -m 755 -d "${pkgdir}/usr/bin"
	ln -s "/usr/lib/${pkgname}/dmMediaConverter" "${pkgdir}/usr/bin/${pkgname}"
} 