#Maintainer: oshaboy <noamgilor{at}protonmail{dot}com>

pkgname=candybox2
pkgver=1
pkgrel=2
pkgdesc="Text Based Incremental Game"
arch=('any')
url="https://github.com/candybox2"
license=('GPL')
depends=(chromium)
optdepends=()
makedepends=(git)
source=("git+https://github.com/candybox2/candybox2.github.io.git")
sha256sums=('SKIP')

desktop_entry="[Desktop Entry]\nType=Link\nIcon=/usr/share/pixmaps/candybox2.png\nName=Candy Box 2\nExec=/usr/bin/candybox2\nTerminal=false\nHidden=false\nCategories=Game\nComment=Incremental Game By Aniwey"
build(){
	echo -e '#!/bin/sh\nchromium -app="file:///opt/candybox2/index.html"' >| ${srcdir}/candybox2.sh
	echo -e $desktop_entry >| ${srcdir}/Candy\ Box\ 2.desktop
}

package(){
	mkdir "${pkgdir}/opt"
	cp -r "${srcdir}/candybox2" "${pkgdir}/opt/candybox2"
	find  ${pkgdir}/opt/candybox2 -type d | xargs chmod 755
	install -Dm755 ${srcdir}/candybox2.sh ${pkgdir}/usr/bin/candybox2
	install -Dm644 ${pkgdir}/opt/candybox2/favicon.png ${pkgdir}/usr/share/pixmaps/candybox2.png
	install -Dm755 ${srcdir}/Candy\ Box\ 2.desktop ${pkgdir}/usr/share/applications/Candy\ Box\ 2.desktop
}
