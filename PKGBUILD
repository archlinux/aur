# Maintainer : Michael DeGuzis <mdeguzis@gmail.com>

pkgname=play-emu-git
_gitname=Play-Build
pkgver=r3.462d986
pkgrel=4
pkgdesc="Play! is an experimental Playstation 2 emulator."
arch=('i686' 'x86_64')
url="https://github.com/jpd002"
license=('GPL')
makedepends=('git')
depends=('boost' 'cmake' 'glew' 'mysql++' 'openal' 
	 'qt5-base' 'zlib')
source=('Play-Build::git+https://github.com/jpd002/Play-Build.git'
	'play-emu.desktop'
	'play.png')
md5sums=('SKIP'
	 '59e7114de681f2f96730697cde4f4595'
	 '2c6db31d8119437e5af6fa95b4c1fb8f')

pkgver() {

  cd $_gitname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

}

prepare () {

  cd $_gitname
  git submodule init
  git submodule update

}

build() {

	cd $_gitname/Play/build_unix
	./build.sh
	
}

package() {

	install -d $pkgdir/usr/bin
	install -d $pkgdir/usr/share/pixmaps
	install -d $pkgdir/usr/share/applications

	install -m755 $srcdir/$_gitname/Play/build_unix/build-ui/Play-Ui $pkgdir/usr/bin/play-emu
	install -m755 play.png $pkgdir/usr/share/pixmaps/play.png
	install -m755 play-emu.desktop $pkgdir/usr/share/applications/play-emu.desktop

}
