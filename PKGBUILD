# Maintainer: Ivy Foster <code@iff.ink>

pkgbase=frotz-git
pkgname=(frotz-dumb-git frotz-ncurses-git frotz-sdl-git)
pkgver=2.54.r109.g4f78491
pkgrel=1
pkgdesc='Z-machine interpreter for interactive fiction games'
makedepends=('git' 'libao' 'libmodplug' 'libsamplerate' 'libsndfile' 'libvorbis' 'ncurses'
     	'freetype2' 'libjpeg-turbo' 'libpng' 'sdl2' 'sdl2_mixer' 'zlib')

arch=(x86_64)
url='https://gitlab.com/DavidGriffith/frotz'
license=(GPL)
source=('git+https://gitlab.com/DavidGriffith/frotz.git')
md5sums=(SKIP)

pkgver() {
	cd frotz
	git describe | sed 's@-\(.*\)-@.r\1.@'
}

build() {
	cd frotz
	make PREFIX=/usr dumb ncurses sdl
}

package_frotz-dumb-git() {
	pkgdesc='Z-machine interpreter for interactive fiction games, for dumb terminals or scripting'
	depends=('glibc')
	provides=('dfrotz' 'frotz-dumb')
	conflicts=('frotz-dumb')

	cd frotz
	make DESTDIR="$pkgdir" PREFIX=/usr install_dumb
}

package_frotz-ncurses-git() {
	pkgdesc='ncurses-based Z-machine interpreter for interactive fiction games'
	provides=('frotz' 'frotz-ncurses')
	conflicts=('frotz-ncurses')
	depends=('libao' 'libmodplug' 'libsamplerate' 'libsndfile' 'ncurses')

	cd frotz
	make DESTDIR="$pkgdir" PREFIX=/usr install_frotz
}

package_frotz-sdl-git() {
	pkgdesc='Graphical Z-machine interpreter for interactive fiction games'
	provides=('sfrotz' 'frotz-sdl')
	conflicts=('frotz-sdl')
	depends=('freetype2' 'libjpeg-turbo' 'sdl2_mixer')

	cd frotz
	make DESTDIR="$pkgdir" PREFIX=/usr install_sdl
}
