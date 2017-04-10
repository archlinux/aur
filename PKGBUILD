# Maintainer: Johannes Larsen <mail at johslarsen dot net>

pkgname="quickstack-git"
pkgver=0.r17.844fd47
pkgrel=2
pkgdesc="quickstack is a tool to take call stack traces with minimal overheads."
arch=('i686' 'x86_64')
url="https://github.com/yoshinorim/quickstack"
license=('BSD')
depends=('binutils' 'libelf')
makedepends=('git' 'cmake')
source=("$pkgname::git+https://github.com/yoshinorim/quickstack")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  mkdir -p "$srcdir/$pkgname/build"
  cd "$srcdir/$pkgname/build"
  cmake -DCMAKE_BUILD_TYPE=RelWithDebInfo \
        -DCMAKE_INSTALL_PREFIX=/usr \
		..
  make
}

package() {
  cd "$srcdir/$pkgname/build"
  make DESTDIR="${pkgdir}/" install
  install -Dm644 ../licenses/COPYING $pkgdir/usr/share/licenses/$pkgname/COPYING
}
