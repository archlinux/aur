# Maintainer: Chris Oelmueller <chris.oelmueller@gmail.com>
# Contributor: apaugh
# Contributor: speps <speps at aur dot archlinux dot org>

pkgname=fife
pkgver=0.4.0
pkgrel=2
_githubname=fifengine
pkgdesc="Flexible Isometric Free Engine is a cross platform game creation framework"
arch=(i686 x86_64)
url="http://fifengine.net/"
license=('LGPL')
depends=('boost' 'boost-libs' 'fifechan' 'libgl' 'libogg' 'libpng' 'libvorbis'
         'sdl2' 'sdl2_ttf' 'sdl2_image' 'openal' 'python2' 'tinyxml' 'zlib')
makedepends=('cmake' 'mesa' 'swig')
source=("https://github.com/${_githubname}/${_githubname}/archive/${pkgver}.tar.gz")
md5sums=('d1bac8339f207b797a2e3dbd85383a66')
sha256sums=('babd4c1c6e2f991d2cf61d5746f34a66ca18e1c95782599c95c4382949d3d8f1')

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
