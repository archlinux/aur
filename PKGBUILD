# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=wiredtiger-git
pkgver=2.6.1.14818
pkgrel=1
pkgdesc="High performance, scalable, production quality, NoSQL, Open Source extensible platform for data management"
arch=('x86_64')
url="http://source.wiredtiger.com/"
license=('GPL')
depends=('glibc')
makedepends=('git')
provides=('wiredtiger')
conflicts=('wiredtiger')
source=("git://github.com/wiredtiger/wiredtiger.git")
md5sums=('SKIP')
_gitname="wiredtiger"

pkgver() {
  cd "$srcdir"/"$_gitname"
  printf %s.%s $(git describe --tags | sed 's|-|.|g') $(git rev-list --count HEAD)
}

build() {
  cd "$srcdir"/"$_gitname"
  
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_gitname"
  make DESTDIR="$pkgdir/" install
}
