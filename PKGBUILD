# Maintainer: Cosku Bas <cosku.bas@gmail.com>

pkgname=quetoo-git
pkgver=r2744.66a6c9f
pkgrel=1
pkgdesc="Quetoo is a Free first person shooter for Mac, PC and Linux."
arch=('i686' 'x86_64')
url="http://quetoo.org"
license=('GPLv2')

makedepends=('git' 'clang' 'autoconf' 'automake' 'check')
depends=('quetoo-data-git' 'curl' 'sdl2' 'sdl2_image' 'sdl2_mixer' 'physfs' 'mesa' 'libgl')

source=(git://github.com/jdolan/quetoo
		quetoo.desktop)
sha1sums=('SKIP'
		'f987aa5296d263138f752321efc23f6cf1acb10a')

build() {
	cd quetoo
	autoreconf -i
	./configure --prefix=/usr
	make
}

pkgver() {
	cd quetoo
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd quetoo
	make DESTDIR="${pkgdir}" install
	install -Dm644 "$srcdir/quetoo.desktop" "$pkgdir/usr/share/applications/quetoo.desktop"
	install -Dm644 "./src/main/quetoo.ico" "$pkgdir/usr/share/pixmaps/quetoo.ico"
}
