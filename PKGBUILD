# Maintainer: Chris Oelmueller <chris.oelmueller@gmail.com>
# Contributor: apaugh
# Contributor: speps <speps at aur dot archlinux dot org>

pkgname=fife
pkgver=0.4.1
pkgrel=2
_githubname=fifengine
pkgdesc="Flexible Isometric Free Engine is a cross platform game creation framework"
arch=(i686 x86_64)
url="http://fifengine.net/"
license=('LGPL')
depends=('boost' 'boost-libs' 'fifechan>=0.1.4' 'libgl' 'libogg' 'libpng' 'libvorbis'
         'sdl2' 'sdl2_ttf' 'sdl2_image' 'openal' 'python2' 'tinyxml' 'zlib')
makedepends=('cmake' 'mesa' 'swig')
source=("https://github.com/${_githubname}/${_githubname}/archive/${pkgver}.tar.gz")
md5sums=('6ce5533102c4993b44c3ba8347f4ca93')
sha256sums=('bae3fc591cc2891f7d1b3a656a5d8ad700ecc2e297ad453bf4f1bcbbf82e8cb2')

prepare() {
  # use python2
  export PYTHON=python2
}

build() {
  cd "${_githubname}-${pkgver}"
  [[ -d "build" ]] && rm -r "build"
  mkdir -p "build" && cd "build"
  cmake \
    -DCMAKE_INSTALL_PREFIX:PATH=/usr \
    ..
  make
  # If compilation seems to stall at 99% for ages, do not abort!
  # While not perfectly convenient, that is to be expected from
  # SWIG. Eventually, you'll reach the holy triple-digit land.
}

package() {
  cd "${_githubname}-${pkgver}"
  cd "build"
  make DESTDIR=$pkgdir install
}

# vim:set ts=2 sw=2 et:
