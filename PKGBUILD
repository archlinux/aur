# Maintainer: Chris Oelmueller <chris.oelmueller@gmail.com>
# Contributor: Yaohan Chen <yaohan.chen@gmail.com>
# Contributor: Thomas Kinnen <thomas.kinnen@gmail.com>
# Contributor: Thomas Kowaliczek-Schmer <thomas.kowaliczek@posteo.de>
pkgname=fife-git
provides=("fife" "fife-svn")
conflicts=("fife" "fife-svn")
pkgdesc="The mission of the FIFE project is to create a cross platform game creation framework"
url="http://www.fifengine.net/"
pkgver=0.4.1.r372.g85626ccd
pkgrel=1
arch=('i686' 'x86_64')
license=('LGPL')
depends=('sdl2' 'boost' 'sdl2_ttf' 'sdl2_image' 'libvorbis' 'libogg' 'openal' 'swig' 'python' 'python-future' 'zlib' 'libgl' 'libpng' 'tinyxml' 'glew' 'fifechan-git')
makedepends=('cmake' 'git')
source=(git+https://github.com/fifengine/fifengine.git)
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/fifengine"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/fifengine"
  # [TODO] Due to severe laziness, I have not tested in-source builds yet
  [[ -d "build" ]] && rm -r "build"
  mkdir -p "build" && cd "build"
  cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr ..
  # to build C/C++ version comment this in and the line above out.
  # cmake -Dbuild-library=ON -DCMAKE_INSTALL_PREFIX:PATH=/usr -DCMAKE_INSTALL_LIBDIR:PATH=/usr/lib ..
  make
}

package() {
  cd "$srcdir/fifengine"
  cd "build"
  make DESTDIR=$pkgdir install
}
