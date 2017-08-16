# Maintainer: Dea1993 <andrea.deangelis93@gmail.com>

pkgname=dmmediaconverter
pkgver=2.1
pkgrel=1
pkgdesc="a FFmpeg frontend (GUI) with video stream copy (pass-through) and other features"
arch=('i686' 'x86_64')
url="http://dmsimpleapps.blogspot.ro/2014/04/dmmediaconverter.html"
license=('custom')
depends=('gtk2' 'desktop-file-utils')
install="${pkgname}.install"
#DLAGENTS=("https::wget -O dmMediaConverter_v2.1.0_linux_x64.tar %u")
DLAGENTS=("http::/usr/bin/wget -O %o %u" "https::/usr/bin/wget %u")
source=(
	"license.zip"::"https://docs.google.com/document/d/1U2xjYwX4VMckRzWc0ol98arPGCb0oaPx6Rw6adRwTjo/export?format=zip"
	"license.txt"::"https://docs.google.com/document/d/1U2xjYwX4VMckRzWc0ol98arPGCb0oaPx6Rw6adRwTjo/export?format=txt"
	"${pkgname}.desktop"::"https://docs.google.com/uc?authuser=0&id=0B8AHSEMWV-pnOEJoeGNPNXBnZ0U&export=download"
	"${pkgname}.png"::"https://docs.google.com/uc?authuser=0&id=0B8AHSEMWV-pnTExiZnpkVHlleGc&export=download"
)

source_x86_64=(
	"dmMediaConverter_v${pkgver}_linux_x64.tar.gz"::"https://drive.google.com/uc?export=download&id=0B1MiTYJef5a9dlZYR0d4Tl9RQlE"
)

source_i686=(
	"dmMediaConverter_v${pkgver}_linux_x86.tar.gz"::"https://drive.google.com/uc?export=download&id=0B1MiTYJef5a9blJNbEJJZmp1Ums"
)

md5sums=('SKIP'
         '16c60312c92ae94e0b2dbd801d4ebeb6'
         '9d88ba18721ca9114a25fa670cdb5ff1'
         'e76a2f880abad88751d2aa7f3d8c8a45')

md5sums_i686=('b1f0318e9fb26820a07fc3973e182324')

md5sums_x86_64=('3447d8b01622087e001ecf62270da18c')


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
