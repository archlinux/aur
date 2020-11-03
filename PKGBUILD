# Maintainer: wereii <wereii+aur@wereii.cz>
# Contributor: Vladimir Cerny <blackvladimir@gmail.com>

pkgname=asco
pkgver=0.4.10
pkgrel=2
pkgdesc="A SPICE Circuit Optimizer."
arch=('i686' 'x86_64')
url="http://asco.sourceforge.net"
license=('GPL')
depends=('glibc')
source=("http://downloads.sourceforge.net/sourceforge/asco/ASCO-$pkgver.tar.gz")
md5sums=('f8832f010f1f0d930878da903a59b028')

prepare() {
  cd "$srcdir/ASCO-$pkgver"
  # append ' -fcommon' after CFLAGS of all Makefiles
  find . -type f -iname "Makefile" -exec sed -i "/^CFLAGS =/ s/$/ -fcommon/" {} \;
}

build() {
  cd "$srcdir/ASCO-$pkgver"
  make
}

package(){
  install -D $srcdir/ASCO-$pkgver/asco "$pkgdir/usr/bin/asco"
}
