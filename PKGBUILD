# Maintainer: John Jenkins twodopeshaggy@gmail.com
# Contributor: Robert Knauer <robert@privatdemail.net>
# Contributor: Asa Marco <marcoasa90<at>gmail[.]com>
# Contributor: Felix Rohrbach <fxrh@gmx.de>
# Contributor: Jorge Araya AKA Shackra <jorgean@lavabit.com>

pkgname=vlmc-git
epoch=1
pkgver=0.3823.fb433b0
pkgrel=1
pkgdesc="VideoLAN Movie Creator, a simple and user-friendly video editor"
arch=('i686' 'x86_64')
url="http://vlmc.org/"
license=('GPL')
depends=('vlc' 'frei0r-plugins')
makedepends=('git' 'cmake' 'qt5-tools')
source=(
  'git+https://code.videolan.org/videolan/vlmc.git'
)

sha256sums=(
  'SKIP'
)
provides=('vlmc')
conflicts=('vlmc')
_gitname="vlmc"

pkgver() {
  cd "${srcdir}/${_gitname}"
  echo "0.$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}


build() {
  cd "${srcdir}/${_gitname}"
  git submodule init
  git submodule update
  mkdir -p 'build'
  cd 'build'
  cmake -Wno-dev -DCMAKE_INSTALL_PREFIX=/usr ../
  make
}

package() {
  cd "${srcdir}/${_gitname}/build"
  make "DESTDIR=${pkgdir}" install
}
