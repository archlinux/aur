# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=wiredtiger-git
pkgver=3.1.0r19536
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
  printf %sr%s $(git describe --tags | tr - .) $(git rev-list --count HEAD)
}

prepare() {
  find  ${pkgname%-git} -name "*.py" -exec sed -i '1s+python+python2+' {} \;
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
