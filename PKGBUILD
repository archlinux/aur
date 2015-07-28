#Maintainer: twa022 <twa022 at gmail dot com>
#Contributor : josephgbr <rafael.f.f1@gmail.com>

_pkgbase=libusb-compat
pkgname=lib32-${_pkgbase}
pkgver=0.1.5
pkgrel=2
pkgdesc="Library to enable user space application programs to communicate with USB devices (32 bit)"
arch=('x86_64')
depends=('lib32-libusb' "${_pkgbase}")
makedepends=('gcc-multilib')
url="http://libusb.sourceforge.net/"
license=('LGPL')
options=('!libtool')
source=("http://downloads.sourceforge.net/libusb/${_pkgbase}-${pkgver%.*}/${_pkgbase}-$pkgver/${_pkgbase}-${pkgver}.tar.bz2")
sha256sums=('404ef4b6b324be79ac1bfb3d839eac860fbc929e6acb1ef88793a6ea328bc55a')

build() {
  export CC="gcc -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
  
  cd ${_pkgbase}-${pkgver}
  ./configure --prefix=/usr --libdir=/usr/lib32
  make
}

package() {
  make -C ${_pkgbase}-${pkgver} DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/{bin,include}
}

