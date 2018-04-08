# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=wiredtiger-git
pkgver=3.0.0.2.g574b928d7.19226
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
options=('!makeflags')
md5sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  printf %s.%s $(git describe --tags | sed 's|-|.|g') $(git rev-list --count HEAD)
}

build() {
  cd ${pkgname%-git}
  
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd ${pkgname%-git}
  make DESTDIR="$pkgdir/" install
}
