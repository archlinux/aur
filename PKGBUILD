# Maintainer: Llewelyn Trahaearn <WoefulDerelict at GMail dot com>
# Contributor: kokoko3k <kokoko3k at gmail dot com>
# Contributor: Ionut Biru <ibiru at archlinux dot org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski at archlinux dot org>

pkgname=lib32-libva
pkgver=1.6.1
pkgrel=1
pkgdesc='Video Acceleration (VA) API for Linux (32-bit)'
arch=('x86_64')
url='http://freedesktop.org/wiki/Software/vaapi'
license=('MIT')
depends=('lib32-libdrm' 'lib32-libgl' 'lib32-wayland' 'lib32-libxext' 'lib32-libxfixes' 'libva')
makedepends=('mesa' 'gcc-multilib')
optdepends=('lib32-libva-vdpau-driver: vdpau back-end for nvidia'
            'lib32-libva-intel-driver: back-end for intel cards')
source=(http://freedesktop.org/software/vaapi/releases/libva/libva-${pkgver}.tar.bz2)
sha512sums=('cd21c27b89c975cbf6cc77125625dca77332467b291536e0fa4640618871be9dbd1c51e7bd09d15b1af8dbd9166a29113f2dd10a50558ffa00d21161cb9d7958')

build() {
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  cd "${pkgname#*-}-${pkgver}"
  ./configure --prefix=/usr --libdir='/usr/lib32' 
  make
}

package() {
  cd "${pkgname#*-}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  rm -rfv "${pkgdir}/usr/"{include,bin}
  install -m644 -D COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}

