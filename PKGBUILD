# Maintainer: Adam Nielsen <malvineous@shikadi.net>

pkgname=adplug-git
pkgver=0
pkgrel=2
epoch=1
pkgdesc="AdLib sound player library"
arch=('i686' 'x86_64')
url="http://adplug.github.io"
license=('LGPL')
depends=('libbinio')
provides=('adplug')
conflicts=('adplug')
source=("git+https://github.com/adplug/adplug.git")
md5sums=('SKIP')

prepare() {
  cd "$srcdir/adplug"

  autoreconf -fis
}

pkgver() {
  cd "$srcdir/adplug"
  git describe --tags | sed 's/^adplug-//g; s/^v//; s/-/./g'
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
