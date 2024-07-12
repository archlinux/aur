# Maintainer: Tobias Powalowski <tpowa@archlinux.org>

pkgname=mp3wrap
pkgver=0.5
pkgrel=7
pkgdesc="Tool for wrapping mp3 files. A free independent alternative to AlbumWrap"
arch=('x86_64')
url="http://mp3wrap.sourceforge.net"
license=('LGPL')
depends=('glibc')
source=(
  "https://downloads.sourceforge.net/sourceforge/mp3wrap/mp3wrap-$pkgver-src.tar.gz"
  "mp3wrap-0.5-compilation.patch"
)
sha512sums=(
  '2dc7a72a12b9245956000443a51cd5341e1d48795b629f6277f9dd26ac9b3ab2511a119478a10daa9516cb2526073956af42f83410aff1e4eae0c972fdd8b0f1'
  '9bda8c024373200c62e0f0dc6be0b389f434d9570f0a7ca735469fc2b6da9a482cf7ef41723e4b4161c119f96922a916791e34112a9d4f6affbda3d863d26874'
)

prepare() {
  cd mp3wrap-$pkgver
  patch -Np1 < "${srcdir}/mp3wrap-0.5-compilation.patch"
}

build() {
  cd mp3wrap-$pkgver
  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

package() {
  cd mp3wrap-$pkgver
  make DESTDIR="$pkgdir" install
}
