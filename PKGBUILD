# Maintainer: maz-1 <loveayawaka at gmail dot com>
_pkgname=niconvert
pkgname=${_pkgname}-git
pkgver=86.dbc3bc1
pkgrel=1
pkgdesc="Danmaku download and convert tool."
arch=('i686' 'x86_64')
url="https://github.com/muzuiget/niconvert"
license=('GPL3')
depends=('python3' 'tk')
source=("git://github.com/muzuiget/niconvert.git" 
		"niconvert.desktop")
md5sums=('SKIP'
		 'SKIP')

_gitname=$_pkgname
pkgver() {
	cd "$srcdir/$_gitname"
	echo "$(git rev-list --count HEAD).$(git describe --always)"
}

package() {
	install -dm 755 ${pkgdir}/usr/{bin,share/niconvert}
	cd $srcdir/$_gitname
	cp -r ./* ${pkgdir}/usr/share/niconvert
    echo '#!/bin/sh' >> ${pkgdir}/usr/bin/niconvert
	echo 'exec python3 /usr/share/niconvert/niconvert.pyw "$@"' >> ${pkgdir}/usr/bin/niconvert
	chmod +x ${pkgdir}/usr/bin/niconvert
	install -Dm 644 ${srcdir}/niconvert.desktop ${pkgdir}/usr/share/applications/niconvert.desktop
}
