# Maintainer: Mihai Coman <mihai@m1x.ro>
# Contributor: Alexander Georgievskiy <galeksandrp@gmail.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Llewelyn Trahaearn <WoefulDerelict at GMail dot com>
# Contributor: kokoko3k <kokoko3k at gmail dot com>
# Contributor: Ionut Biru <ibiru at archlinux dot org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski at archlinux dot org>
 
pkgname=lib32-libva1-compat
pkgver=1.8.3
pkgrel=1
pkgdesc='Video Acceleration (VA) API for Linux (32-bit)'
arch=(x86_64)
url='https://freedesktop.org/wiki/Software/vaapi'
license=('MIT')
depends=(lib32-libdrm lib32-libgl lib32-wayland lib32-libxext lib32-libxfixes libva)
makedepends=(mesa gcc-multilib)
optdepends=('lib32-libva-vdpau-driver: vdpau back-end for nvidia'
            'lib32-libva-intel-driver: back-end for intel cards')
source=("https://github.com/intel/libva/releases/download/${pkgver}/libva-${pkgver}.tar.bz2")
sha512sums=('870cfaa5c4487f4cb4b01c11379484e3884aa5e9026c3836cc7681804a5e08a0b245b2aa788984a24a3094bd64068fbd0406e66cb4c5e30fc84e31095eb4a3e1')
 
build() {
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
 
  cd libva-${pkgver}
  ./configure --prefix=/usr --libdir='/usr/lib32' 
  make
}
 
package() {
  cd libva-${pkgver}
  make DESTDIR="${pkgdir}" install
  rm -rfv "${pkgdir}/usr/"{include,bin}
  install -m644 -D COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
  rm -rf "${pkgdir}"/usr/{include,lib32/{lib*.so,pkgconfig},share}
}
