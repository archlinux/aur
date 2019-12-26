# Maintainer: Solomon Choina <shlomochoina@gmail.com>

pkgname=libutp-git
_pkgname=libutp
pkgver=r99.fda9f4b
pkgrel=2
epoch=3
pkgdesc='uTorrent Transport Protocol library'
url='https://github.com/bittorrent/libutp'
makedepends=('cmake' 'git')
depends=('glibc')
provides=('libutp')
arch=('i686' 'x86_64')
license=('custom:Public Domain')
source=("git+https://github.com/transmission/libutp.git#branch=post-3.3-transmission")
sha256sums=('SKIP')

pkgver(){
 cd libutp
 printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare(){
if [[ -d $srcdir/build ]]; then
    rm -rf $srcdir/build
  fi
  mkdir $srcdir/build
}
build() {
 cd $srcdir/build
 cmake ../libutp \
  -DCMAKE_INSTALL_PREFIX=/usr 
 
 make
}
package() {
  #cd libutp
  #arch-meson build
  #DESTDIR=$pkgdir ninja -C build install
  #mkdir -p $pkgdir/usr/include/libutp
  #install -D libutp/libutp.a $pkgdir/usr/lib/libutp.a
  #install -D libutp/libutp.so $pkgdir/usr/lib/libutp.so
  #cp libutp/*.h $pkgdir/usr/include/libutp
  cd $srcdir/build
  make DESTDIR="${pkgdir}" install
}
