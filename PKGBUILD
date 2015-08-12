# Maintainer: Jerome Rose <jrose[dot]pub[at]gmail[dot]com>
pkgname=sfemovie-git
pkgver=1
pkgrel=2
pkgdesc="sfeMovie is a simple C++ library that lets you play movies in SFML based applications. It relies on FFmpeg to read medias and remains consistent with SFML's naming conventions."
url="https://github.com/Yalir/sfeMovie"
arch=('x86_64' 'i686')
license=('LGPLv2.1')
depends=('sfml' 'ffmpeg')
optdepends=()
makedepends=('git' 'cmake' 'yasm')
conflicts=('sfemovie')
provides=('sfemovie')
replaces=()
backup=()
#install='foo.install'
source=()
md5sums=()
_pkgnameshort=sfeMovie
_gitsource=https://github.com/Yalir/sfeMovie.git
_gitbranch=master

build() {
  cd "${srcdir}"
  git clone $_gitsource
  cd "${srcdir}/${_pkgnameshort}"
  git checkout $_gitbranch
  cmake ./ -DCMAKE_INSTALL_PREFIX=/usr \
    -DSFEMOVIE_BUILD_FFMPEG:BOOL=FALSE \
    -DLINK_AGAINST_INTERNAL_FFMPEG:BOOL=FALSE
  make
}

package() {
  cd "${srcdir}/${_pkgnameshort}"
  make DESTDIR="${pkgdir}" install
}
