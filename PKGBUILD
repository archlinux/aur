
# Maintainer: Nick Barrett <nick.barrett.93@gmail.com>
pkgname=anax
pkgver=v2.0.0.r9.g448e6c3
pkgrel=1
pkgdesc="An open source C++ entity system"
arch=('i686' 'x86_64')
url="https://github.com/miguelmartin75/anax"
license=('MIT')
groups=()
depends=(boost)
makedepends=('git cmake')
provides=("$pkgname")
conflicts=("$pkgname")
backup=()
options=()
source=("$pkgname::git+https://github.com/miguelmartin75/anax.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"

# Git, tags available
  git describe --tags | git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$pkgname"
# Run cmake here
  rm -fr build
  mkdir build 
  cd build
  cmake .. -DBUILD_SHARED_LIBS=false -DBUILD_DOCS=true
}

package() {
  cd "$srcdir/$pkgname/build"
  make DESTDIR="$pkgdir/" install
}
