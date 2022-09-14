# Maintainer: epitron
pkgname=soundtracker-git
_gitname=soundtracker
pkgver=r560.8f1d335
pkgrel=1
pkgdesc="A FutureTrackerII-style music tracker (only supports .MOD and .XM)"
arch=('i686' 'x86_64')
url="https://soundtracker.org"
license=('GPL2')
depends=('gtk2' 'libsndfile')
optdepends=('alsa-lib' 'pulseaudio' 'jack2' 'sdl2')
makedepends=('git' 'autoconf')
source=("$_gitname"::"git+https://git.code.sf.net/p/soundtracker/git")
md5sums=('SKIP')

pkgver() {
    cd $_gitname
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $_gitname/
  
  autoreconf -vfi
  ./configure --prefix=/usr
  make
}

package() {
  cd $_gitname/

  make PREFIX=/usr DESTDIR="$pkgdir/" install
}
