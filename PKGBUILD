# Maintainer : Michael DeGuzis <mdeguzis@gmail.com>

pkgname=play-emu-git
_gitname=Play-Build
pkgver=r3.462d986
pkgrel=2
pkgdesc="Play! is an experimental Playstation 2 emulator."
arch=('i686' 'x86_64')
url="https://github.com/jpd002"
license=('GPL')
makedepends=('git')
depends=('boost' 'cmake' 'glew' 'mysql++' 'openal' 
	 'qt5-base' 'zlib')
source=('Play-Build::git+https://github.com/jpd002/Play-Build.git')
md5sums=('SKIP')

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
	install -m755 $srcdir/$_gitname/Play/build_unix/build-ui/Play-Ui $pkgdir/usr/bin/play

}
