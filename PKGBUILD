# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

_name=sdl_sound
pkgname=$_name-hg
pkgver=r596.719dade41745
pkgrel=1
pkgdesc="A library to decode several popular sound file formats (development version)"
arch=('i686' 'x86_64')
url="http://icculus.org/SDL_sound/"
license=('LGPL')
depends=('sdl' 'libmodplug' 'libvorbis' 'flac' 'speex')
makedepends=('mercurial')
conflicts=("$_name")
provides=("$_name")
source=($_name::"hg+http://hg.icculus.org/icculus/SDL_sound"
        'physfs-renamed-export.patch')
sha256sums=('SKIP'
            'd7bd96390d9bc877c0204922c7c4666cadfdccc5e6c0cfcf9477d113377f5d10')

pkgver() {
  cd $_name

  printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

prepare() {
  cd $_name

  # fix deprecated physfs declaration
  patch -Np1 < ../physfs-renamed-export.patch
}

build() {
  cd $_name

  ./bootstrap
  ./configure --prefix=/usr --disable-static --disable-mikmod
  make
}

package() {
  make -C $_name DESTDIR="$pkgdir/" install
}
