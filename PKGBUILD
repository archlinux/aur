# Maintainer: Tobias Frilling <tobias@frilling-online.de>
pkgname=devtodo
pkgver=0.1.20
pkgrel=1
pkgdesc="A console-based, per-folder, simple, and flexible todo list"
arch=('i686' 'x86_64')
url="http://swapoff.org/devtodo1.html"
license=("GPL")
depends=('readline')
backup=('etc/todorc')
source=("http://swapoff.org/files/$pkgname/$pkgname-$pkgver.tar.gz"
        'stdlib.patch')
md5sums=('4a6241437cb56f237f850bcd2233c3c4'
         '1e2dea01444c8d47068f351d96937573')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -p1 < "$startdir"/stdlib.patch
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
