# Maintainer: Fabio Loli <loli_fabio@protonmail.com> -> https://github.com/FabioLolix

pkgname=libav-no-libs
pkgver=12.2
pkgrel=1
pkgdesc="Open source audio and video processing tools forked from ffmpeg"
arch=('i686' 'x86_64')
url="http://www.libav.org/"
license=('LGPL')
depends=('sdl' 'ffmpeg')
makedepends=('yasm')
provides=('libav-no-libs')
conflicts=('libav' 'libav-no-libs' 'libav-no-libs-git' 'libav-git-no-libs')
source=("http://libav.org/releases/libav-$pkgver.tar.xz")
md5sums=('69b5d9de6e4b2fbf6956653f61c7ffe1')

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

