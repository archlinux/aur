# $Id: PKGBUILD 108863 2014-04-05 16:08:43Z bpiotrowski $
# Maintainer:  Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Behem0th <grantipak@gmail.com>
_pkgbasename=libvdpau-va-gl
pkgname=lib32-libvdpau-va-gl
pkgver=0.3.4
pkgrel=1
pkgdesc='VDPAU driver with OpenGL/VAAPI backend'
arch=('x86_64')
url='https://github.com/i-rinat/libvdpau-va-gl'
license=('LGPL3')
depends=('lib32-libvdpau' 'lib32-libva' 'lib32-libgl' 'lib32-glu' 'lib32-ffmpeg')
makedepends=('cmake' 'gcc-multilib')
source=($url/archive/v$pkgver.tar.gz)
md5sums=('09ceb2f75eafccc9b002d35ede0de6a5')

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd $_pkgbasename-$pkgver
  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=/usr/lib32
  make
}

package() {
  make -C $_pkgbasename-$pkgver DESTDIR="$pkgdir" install
  #Yes, an ugly hack!
  mv $pkgdir/usr/lib $pkgdir/usr/lib32 
}
