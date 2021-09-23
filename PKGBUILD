# Maintainer: mawenbo <b1431736437@163.com>
pkgname=wine-arm
pkgver=6.17
pkgrel=1
pkgdesc="Wine is not emulator"
url="https://winehq.org"
license=(LGPL)
arch=('aarch64' 'armv7')
depends=()
makedepends=('alsa-lib' 'libpulse' 'dbus' 'fontconfig' 'freetype2' 'gnutls' 'libjpeg-turbo' 'libpng' 'libtiff' 'mesa' 'libxml2' 'libxslt' 'faudio' 'gstreamer' 'mpg123' 'sdl2' 'vkd3d' 'vulkan-headers' 'bison' 'clang' 'gcc' 'make')
checkdepends=(desktop-file-utils)
source=("https://dl.winehq.org/wine/source/6.x/wine-$pkgver.tar.xz")
sha256sums=('SKIP')

build() {
cd $srcdir/wine-$pkgver/
echo 正在安装，可能需要亿些时间
./configure --prefix=/usr --without-x --without-freetype CC=clang CXX=clang++
make -j6
}
package() {
make STRIP=true prefix="$pkgdir/usr" \
       libdir="$pkgdir/usr/lib" \                                                              
       dlldir="$pkgdir/usr/lib/wine" install
}
