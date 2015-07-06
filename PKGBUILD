# $Id: PKGBUILD 208592 2014-03-24 15:32:22Z bpiotrowski $
# Maintainer: Ionut Biru <ibiru@archlinux.org>
# Maintainer: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>

pkgname=lib32-libva
pkgver=1.6.0
pkgrel=1
pkgdesc='Video Acceleration (VA) API for Linux'
arch=('x86_64')
url='http://freedesktop.org/wiki/Software/vaapi'
license=('MIT')
depends=('lib32-libgl' 'lib32-libdrm' 'lib32-libxfixes')
makedepends=('mesa' 'gcc-multilib' 'libva')
optdepends=('lib32-libva-vdpau-driver: vdpau back-end for nvidia'
            'lib32-libva-intel-driver: back-end for intel cards')
source=(http://freedesktop.org/software/vaapi/releases/libva/libva-$pkgver.tar.bz2)
md5sums=('3f1241b4080db53c120325932f393f33')

build() {
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  cd ${pkgname#*-}-${pkgver}
  ./configure --prefix=/usr --libdir='/usr/lib32' 
  make
}

package() {
  cd ${pkgname#*-}-${pkgver}
  make DESTDIR="$pkgdir" install
  rm -rfv "${pkgdir}"/usr/{include,bin}
  install -m644 -D COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}

