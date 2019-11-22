# Maintainer:  Juan Cuzmar <juan.cuzmar.s@gmail.com>
# Contributor: Juan Cuzmar <juan.cuzmar.s@gmail.com>

pkgname=kbdlight-git
pkgver=1.5.r0.g7d186ac
pkgrel=1
pkgdesc='Program to management keyboard brightness'
arch=('i686' 'x86_64')
url="https://github.com/glats/kbdlight"
license=('GPL3')
depends=('glibc')
makedepends=('git')
conflicts=('kbdlight')
provides=('kbdlight')
source=('git+https://github.com/glats/kbdlight.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/kbdlight"
  git describe --tags --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}
prepare() {
  cd "$srcdir/kbdlight"
  autoreconf -if
}

build(){
  cd "$srcdir/kbdlight"
  ./configure --prefix=/usr
  make
}

package(){
  cd "$srcdir/kbdlight"
  make DESTDIR="$pkgdir/" PREFIX=/usr install
}
