# Maintainer: F_TD5X <mjikop1231@gmail.com> 
pkgname=ffmpeg-rockchip-git
pkgver=2024.08.07
pkgrel=1
pkgdesc="FFmpeg with async and zero-copy Rockchip MPP & RGA support"
arch=('aarch64')
url="https://github.com/nyanmisaka/ffmpeg-rockchip"
license=('GPL2' 'GPL3' 'LGPL3')
depends=('gcc' 'make' 'yasm' 'pkg-config' 'x264' 'x265' 'libvpx' 'libfdk-aac' 'opus' 'libvorbis' 'libass' 'libwebp' 'libmfx')
makedepends=('git')
source=("$pkgname::git+$url")
md5sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"
  ./configure --prefix=/usr \
              --disable-debug \
              --disable-static \
              --enable-shared \
              --enable-gpl \
              --enable-version3 \
              --enable-nonfree \
              --enable-libx264 \
              --enable-libx265 \
              --enable-libvpx \
              --enable-libfdk-aac \
              --enable-libopus \
              --enable-libvorbis \
              --enable-libass \
              --enable-libwebp \
              --enable-libmfx \
              --enable-rkmpp \
              --enable-rkrga
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir/" install
}
