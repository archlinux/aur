# Maintainer: Lance Chen <cyen0312@gmail.com>

pkgname=snowcrash
pkgver=0.16.1.r28.gd4b6e17
pkgrel=1
pkgdesc="API Blueprint Parser"
arch=('i686' 'x86_64')
url="https://github.com/apiaryio/snowcrash"
license=('MIT')
makedepends=('git')
source=("git+https://github.com/apiaryio/snowcrash")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
	cd "$srcdir/$pkgname"
  git submodule update --init --recursive
}

build() {
	cd "$srcdir/$pkgname"
	./configure
	make
}

check() {
	cd "$srcdir/$pkgname"
	./configure
	make test
}

package() {
	cd "$srcdir/$pkgname"
  install -m 755 -D "bin/snowcrash" "$pkgdir/usr/bin/snowcrash"
}
