# Maintainer: Nissar Chababy <funilrys at outlook dot com>
# Ex-Maintainer:  Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Behem0th <grantipak@gmail.com>
_pkgbasename=libvdpau-va-gl
pkgname=lib32-libvdpau-va-gl
pkgver=0.4.2
pkgrel=2
pkgdesc='VDPAU driver with OpenGL/VAAPI backend'
arch=('x86_64')
url='https://github.com/i-rinat/libvdpau-va-gl'
license=('LGPL3')
depends=('lib32-libvdpau' 'lib32-libva' 'lib32-libgl' 'lib32-glu')
makedepends=('cmake' 'gcc-multilib')
source=($url/archive/v$pkgver.tar.gz)
sha512sums=('074f06a0684a28dfd2690d7f878d1e1c1a6a61cb4fba00b54c4b01e9da7baa627333fb59715de0dfb757637afb269c1a62caa3955d53cea75f4a9513c4286680')

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
