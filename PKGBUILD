# Maintainer: Solomon Choina <shlomochoina@gmail.com>

pkgname=libutp-git
_pkgname=libutp
pkgver=r99.fda9f4b
pkgrel=2
pkgdesc='uTorrent Transport Protocol library'
url='https://github.com/bittorrent/libutp'
depends=('glibc')
provides=('libutp')
arch=('i686' 'x86_64')
license=('custom:Public Domain')
source=("git+https://github.com/transmission/libutp#branch=post-3.3-transmission")
sha256sums=('SKIP')

prepare(){
if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}
pkgver(){
 cd libutp
 printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd build
  cmake ../$_pkgname -DCMAKE_INSTALL_PREFIX='/usr' -DCMAKE_INSTALL_LIBDIR='/usr/lib' 
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
