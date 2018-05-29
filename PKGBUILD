# Maintainer: Adam Fontenot <fontenot@ucla.edu>

pkgname=heif-gimp-plugin
_libname=libheif
pkgver=1.1.0
pkgrel=2
pkgdesc="A GIMP plugin for loading and saving HEIF images"
arch=('i686' 'x86_64')
url="https://github.com/strukturag/heif-gimp-plugin"
license=('GPL3')
depends=('libheif')
source=("$url/archive/$_libname-v$pkgver.tar.gz")
sha256sums=('11116a32a8e13c1b8bc718c8775a3fb30c3079bff8a648aeeed60b6132e00edf')

build() {
  cd "$pkgname-$_libname-v$pkgver"
  ./autogen.sh
  CFLAGS+=" -Wno-error=deprecated-declarations" ./configure --prefix=/usr --enable-static=no
  make 
}

package() {
  cd "$pkgname-$_libname-v$pkgver"
  make DESTDIR="$pkgdir" install
}
