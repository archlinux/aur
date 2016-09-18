# Maintainer: Cosku Bas <cosku.bas@gmail.com>

pkgname=gtkradiant-git
pkgver=r850.8557f18
pkgrel=1
pkgdesc="GtkRadiant is the official level design toolchain for games powered by id Tech engines."
arch=('i686' 'x86_64')
url="http://icculus.org/gtkradiant/"
license=('GPLv2')

makedepends=('git' 'svn' 'scons')
depends=('gtkglext' 'libgl' 'gtk2' 'libjpeg' 'libpng' 'zlib' 'libxml2')

source=(git://github.com/TTimo/GtkRadiant.git
		gtkradiant.desktop
		gtkradiant.png)
sha1sums=('SKIP'
		'5a876097bcba753c22ea3b9771619ea737cccabf'
		'6ea35c575cc8036201ea62c51a77091ae51ba1d5')

build() {
	cd GtkRadiant
	scons BUILD=release
}

pkgver() {
	cd GtkRadiant
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd GtkRadiant
	mkdir -p $pkgdir/opt/gtkradiant
	cp -r install/* $pkgdir/opt/gtkradiant/.
	install -Dm644 "$srcdir/gtkradiant.desktop" "$pkgdir/usr/share/applications/gtkradiant.desktop"
	install -Dm644 "$srcdir/gtkradiant.png" "$pkgdir/usr/share/pixmaps/gtkradiant.png"
}
