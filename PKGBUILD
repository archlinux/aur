# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix

pkgname=libav-no-libs
pkgver=12.3
pkgrel=1
pkgdesc="Open source audio and video processing tools forked from ffmpeg"
arch=('i686' 'x86_64')
url="https://www.libav.org/"
license=('LGPL')
depends=('sdl' 'ffmpeg')
makedepends=('yasm')
provides=('libav-no-libs')
conflicts=('libav' 'libav-no-libs' 'libav-no-libs-git' 'libav-git-no-libs')
source=("http://libav.org/releases/libav-$pkgver.tar.xz")
md5sums=('753ec26481b0582eb737383bd8a350a5')

build() {
  cd "$srcdir/libav-$pkgver"

  ./configure \
    --prefix=/usr \
    --enable-nonfree \
    --disable-static \
    --enable-shared \
    --disable-debug \
    --disable-pthreads
  make
}

package() {
  cd "$srcdir/libav-$pkgver"

  make DESTDIR="$pkgdir" install
  rm -r "$pkgdir"/usr/{include,lib}
}

