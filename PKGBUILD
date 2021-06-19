# Maintainer: fansuregrin <quarlong@qq.com>
pkgname=cnkiexpress
_pkgname=$pkgname
pkgver=0.0.11
pkgrel=1
pkgdesc="A reading software for academic research articles developed by CNKI"
arch=("x86_64")
url="https://cajviewer.cnki.net"
license=('custom')
depends=('zlib' 'hicolor-icon-theme')
makedepends=('sed')
source=("https://download.cnki.net/cnkiexpress/cnkiexpress_0.0.11_amd64.deb")
sha256sums=('9a93e9a95454ea09cbec770e2be139339f0bffa9f703e23826807557389a2c9a')
options=(!strip)

package(){
	cd ${srcdir}	
	tar -xJf data.tar.xz
	install -Dm755 "opt/$_pkgname/$_pkgname.AppImage" "$pkgdir/opt/$_pkgname/$_pkgname.AppImage"	
	install -Dm644 "usr/share/mime/packages/$_pkgname.xml" "$pkgdir/usr/share/mime/packages/$_pkgname.xml" 
	install -Dm644 "usr/share/applications/$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
	sed -i "s/Name/Name[zh_CN]/g" "$pkgdir/usr/share/applications/$_pkgname.desktop" 
	sed -i "/Name/i\Name=CNKI Express" "$pkgdir/usr/share/applications/$_pkgname.desktop" 
	mkdir -p "$pkgdir/usr/bin"
	mkdir -p "$pkgdir/usr/share/icons/hicolor"
	cp -R "usr/share/icons/hicolor" "$pkgdir/usr/share/icons"	
	ln -sf "/opt/$_pkgname/$_pkgname.AppImage" "$pkgdir/usr/bin/$_pkgname"
}
