# Maintainer: Chris Oelmueller <chris.oelmueller@gmail.com>
# Contributor: Yaohan Chen <yaohan.chen@gmail.com>
# Contributor: Thomas Kinnen <thomas.kinnen@gmail.com>
pkgname=fife-git
provides=("fife" "fife-svn")
conflicts=("fife" "fife-svn")
pkgdesc="The mission of the FIFE project is to create a cross platform game creation framework"
url="http://www.fifengine.net/"
pkgver=0.3.4.r293.g50d2f7c
pkgrel=1
arch=('i686' 'x86_64')
license=('LGPL')
depends=('sdl' 'boost' 'sdl_ttf' 'sdl_image' 'libvorbis' 'libogg' 'openal' 'swig2' 'python2' 'zlib' 'libgl' 'libpng' 'tinyxml' 'fifechan-git')
makedepends=('scons' 'git')
source=(git+https://github.com/fifengine/fifengine.git)
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/fifengine"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/fifengine"
  SWIG="swig-2" scons
}

package() {
  cd "$srcdir/fifengine"
  SWIG="swig-2" scons install-python --prefix="$pkgdir/usr" --python-prefix="$pkgdir/usr/lib/python2.7/site-packages/"
}
