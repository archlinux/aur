# Maintainer: farwayer <farwayer [at] gmail [dot] com>

_pkgbase=opus
pkgname=lib32-$_pkgbase
pkgver=1.1
pkgrel=1
pkgdesc="Codec designed for interactive speech and audio transmission over the Internet"
arch=('x86_64')
url="http://www.opus-codec.org/"
license=('custom')
depends=('lib32-glibc' 'opus')
options=('!libtool')
source=("http://downloads.xiph.org/releases/${_pkgbase}/${_pkgbase}-${pkgver}.tar.gz")
sha256sums=('b9727015a58affcf3db527322bf8c4d2fcf39f5f6b8f15dbceca20206cbe1d95')

build() {
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  
  cd ${_pkgbase}-${pkgver}
  ./configure --prefix=/usr --enable-custom-modes --libdir=/usr/lib32
  make
}

package() {
  cd ${_pkgbase}-${pkgver}
  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/{include,share}
  install -D COPYING "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE
}
