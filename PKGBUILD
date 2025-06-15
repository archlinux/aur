# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=libopenmpt-modplug
_pkgver=0.8.9.0-openmpt1
pkgver=${_pkgver%-*}
pkgrel=3
pkgdesc='A compat layer/bridge from libmodplug to libopenmpt'
url='http://lib.openmpt.org/'
license=('BSD')
arch=('i686' 'x86_64')
depends=('libopenmpt>=0.5.0')
conflicts=('libmodplug')
provides=('libmodplug')
install='libopenmpt-modplug.install'
source=("https://lib.openmpt.org/files/$pkgname/$pkgname-${_pkgver}.tar.gz" "cstdint.patch")
sha256sums=('ecce1a0eecfdb0b5824cab89c270dce59596295a2c17c2b043215ecf4d7c4ff7' 'f940b0ef61feac3a5b63a6a475663d3064e8f8d60686677900781aaa307591f8')

prepare() {
cd $pkgbase-$_pkgver/libmodplug

patch -p0 -i "${srcdir}/cstdint.patch"

}

build() {
  cd $pkgbase-$_pkgver

  ./configure --prefix=/usr --enable-libmodplug --enable-silent-rules
  make
}

package() {
  cd $pkgbase-$_pkgver

  make DESTDIR="$pkgdir" install

  # link license
  mkdir -p "$pkgdir"/usr/share/licenses/$pkgname
  ln -s ../../doc/$pkgname/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
