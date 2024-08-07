# Maintainer: F_TD5X <mjikop1231@gmail.com> 
pkgname=ffmpeg-rockchip-git
pkgver=2024.08.07
pkgrel=1
pkgdesc="FFmpeg with async and zero-copy Rockchip MPP & RGA support"
arch=('aarch64')
url="https://github.com/nyanmisaka/ffmpeg-rockchip"
license=('GPL2' 'GPL3' 'LGPL3')
depends=('x264' 'x265' 'libvpx' 'libdrm' 'libfdk-aac' 'opus' 'libvorbis' 'libass' 'libwebp' 'rkmpp-git' 'rkrga-git')
makedepends=('gcc' 'make' 'yasm' 'pkg-config')
source=("$pkgname.tar.gz::https://github.com/nyanmisaka/ffmpeg-rockchip/archive/8164ff7dadd655d78a28340ddc9fcef9af6999bb.zip")
sha256sums=('fe330155e6bb254f85b1b7c382b273b2545cf589d0524511830c8e3d444186a7')

build() {
  cd "$srcdir/ffmpeg-rockchip-8164ff7dadd655d78a28340ddc9fcef9af6999bb"
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
              --enable-rkmpp \
              --enable-libdrm \
              --enable-rkrga
  make
}

package() {
  cd "$srcdir/ffmpeg-rockchip-8164ff7dadd655d78a28340ddc9fcef9af6999bb"
  make DESTDIR="$pkgdir/" install
}
