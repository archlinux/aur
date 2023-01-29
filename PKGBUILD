# Maintainer: Frederic Bezies < fredbezies at gmail dot com >
# Contributor: Cosku Bas <cosku.bas@gmail.com>

pkgname=quetoo-git
pkgver=r7858.6fcf06dac
pkgrel=1
pkgdesc="Quetoo is a Free first person shooter for Mac, PC and Linux."
arch=('i686' 'x86_64')
url="http://quetoo.org"
license=('GPL2')
makedepends=('git' 'clang' 'autoconf' 'automake' 'check')
depends=('quetoo-data-git' 'objectivelymvc-git' 'curl' 'sdl2' 'sdl2_image' 'sdl2_mixer' 'physfs' 'openal' 'libsndfile')
source=(git+https://github.com/jdolan/quetoo
		quetoo.desktop
		quetoo.png)
sha1sums=('SKIP'
		'c4ebfb3c3414a9d189f29c79f2ef860d7108c40e'
		'c7c1d2c8093fbf6fcd24f8f848955d922d7bd9fa')

pkgver() {
	cd quetoo
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd quetoo
	autoreconf -i
	./configure --prefix=/usr
	make
}

package() {
	cd quetoo
	make DESTDIR="${pkgdir}" install
	install -Dm644 "$srcdir/quetoo.desktop" "$pkgdir/usr/share/applications/quetoo.desktop"
	install -Dm644 "$srcdir/quetoo.png" "$pkgdir/usr/share/pixmaps/quetoo.png"
}
