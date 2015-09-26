# Maintainer: Trevor <assviolat0r at live dot com>
# Co-maintainer: Giovanni 'ItachiSan' Santini <giovannisantini93@yahoo.it>
pkgname=skype-desktop-bin
pkgver=8594308
pkgrel=1
pkgdesc="An unofficial client of Skype for Linux, running on top of Node Webkit."
arch=('i686' 'x86_64')
url="https://github.com/haskellcamargo/skype-unofficial-client"
license=('MIT')
depends=('gconf' 'libnotify')
makedepends=('make' 'git')
#options=('!strip')
# Actually check for the architecture (Trevor, is so much juice! :D)
[ "$CARCH" = "i686" ]   && _platform=linux_x86
[ "$CARCH" = "x86_64" ] && _platform=linux_x64
source=(git+https://github.com/haskellcamargo/skype-unofficial-client.git
	0001-Adding-PREFIX-variable.patch)
md5sums=('SKIP'
         'c419c56f8551b794ce355b955ea63b96')
_gitname=skype-unofficial-client

pkgver () {
	cd $_gitname
	echo $(git describe --always | sed 's/-/./g')
}

prepare() {
	cd "$srcdir/$_gitname"
	patch -p1 -i ../0001-Adding-PREFIX-variable.patch
}

package() {
	cd "$srcdir/$_gitname" # Git name and $pkgname differs

	# Creating missing folders
	mkdir -p "$pkgdir/usr/share/icons/hicolor/512x512/apps/"
	mkdir -p "$pkgdir/usr/share/applications"
	mkdir -p "$pkgdir/usr/bin"

	# Do the actual installation
	make PREFIX=$pkgdir $_platform
}

