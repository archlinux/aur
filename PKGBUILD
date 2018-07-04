_realpkg=ncurses
pkgname=ncurses-nonwide
pkgver=6.1
pkgrel=3
pkgdesc='ncurses without widechar support and ABI 5 version. required by golded-plus-git'
arch=(x86_64)
url='http://invisible-island.net/ncurses/ncurses.html'
depends=(glibc gcc-libs)
source=(https://ftp.gnu.org/pub/gnu/ncurses/ncurses-$pkgver.tar.gz)

build() {
  cd ${_realpkg}-$pkgver
  ./configure --prefix=/opt/${pkgname} \
    --mandir=/opt/${pkgname}/usr/share/man \
    --with-pkg-config-libdir=/opt/${pkgname}/usr/lib/pkgconfig \
    --with-shared --with-normal --without-debug --without-ada \
    --disable-widec --enable-pc-files --with-cxx-binding --with-cxx-shared \
    --without-manpages --without-tests --without-pkg-config \
    --with-static --with-cxx-static --with-abi-version=5
  make
}

package() {
  cd ${_realpkg}-$pkgver
  make DESTDIR="$pkgdir" install
}

md5sums=('98c889aaf8d23910d2b92d65be2e737a')
