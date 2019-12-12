#Maintainer: oshaboy <noamgilor{at}protonmail{dot}com>

pkgname=candybox
pkgver=1
pkgrel=2.01
pkgdesc="Text Based Incremental Game"
arch=('any')
url="https://github.com/candybox2"
license=('GPL')
depends=(chromium)
optdepends=()
makedepends=(git)
source=("git+https://github.com/candybox2/candybox.git")
sha256sums=('SKIP')

desktop_entry="[Desktop Entry]\nType=Link\nIcon=/usr/share/pixmaps/candybox.ico\nName=Candy Box\nExec=/usr/bin/candybox\nTerminal=false\nHidden=false\nCategories=Game\nComment=Incremental Game By Aniwey"
build(){
	echo -e '#!/bin/sh\nchromium -app="file:///opt/candybox/index.html"' >| ${srcdir}/candybox.sh
	echo -e $desktop_entry >| ${srcdir}/Candy\ Box.desktop
}

package(){
	mkdir "${pkgdir}/opt" 
	cp -r "${srcdir}/candybox" "${pkgdir}/opt/candybox"
	find  ${pkgdir}/opt/candybox -type d | xargs chmod 755
	install -Dm755 ${srcdir}/candybox.sh ${pkgdir}/usr/bin/candybox
	install -Dm644 ${pkgdir}/opt/candybox/favicon.ico ${pkgdir}/usr/share/pixmaps/candybox.ico
	install -Dm755 ${srcdir}/Candy\ Box.desktop ${pkgdir}/usr/share/applications/Candy\ Box.desktop
}
