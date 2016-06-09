# Maintainer: Chris Oelmueller <chris.oelmueller@gmail.com>
# Contributor: Yaohan Chen <yaohan.chen@gmail.com>
# Contributor: Thomas Kinnen <thomas.kinnen@gmail.com>
pkgname=fife-git
provides=("fife" "fife-svn")
conflicts=("fife" "fife-svn")
pkgdesc="The mission of the FIFE project is to create a cross platform game creation framework"
url="http://www.fifengine.net/"
pkgver=0.3.4.r342.g38f435b
pkgrel=1
arch=('i686' 'x86_64')
license=('LGPL')
depends=('sdl2' 'boost' 'sdl2_ttf' 'sdl2_image' 'libvorbis' 'libogg' 'openal' 'swig' 'python2' 'zlib' 'libgl' 'libpng' 'tinyxml' 'fifechan-git')
makedepends=('scons' 'git')
source=(git+https://github.com/fifengine/fifengine.git)
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/fifengine"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/fifengine"
  scons
}

package() {
  cd "$srcdir/fifengine"
  scons install-python --prefix="$pkgdir/usr" --python-prefix="$pkgdir/usr/lib/python2.7/site-packages/"
}
