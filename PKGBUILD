# Maintainer: Adam Nielsen <malvineous@shikadi.net>

pkgname=adplug-git
pkgver=20160430
pkgrel=1
pkgdesc="AdLib sound player library"
arch=('i686' 'x86_64')
url="http://adplug.github.io"
license=('LGPL')
depends=('libbinio')
provides=('adplug')
conflicts=('adplug')
source=("git://github.com/adplug/adplug.git")
md5sums=('SKIP')

prepare() {
  cd "$srcdir/adplug"

  autoreconf -fis
}

build() {
  cd "$srcdir/adplug"
  ./configure --prefix=/usr --enable-maintainer-mode
  make
}

check() {
  cd "$srcdir/adplug"
  make check
}

package() {
  cd "$srcdir/adplug"
  make DESTDIR="$pkgdir" install
  rm "$pkgdir/usr/share/info/dir"
}
