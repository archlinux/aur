# Maintainer: Nicholas Wang <me@nicho1as.wang>

pkgname=gpng-git
pkgver=r9.e834611
pkgrel=1
pkgdesc="A tiny utility that encodes GnuPG messages into PNG format."
arch=('x86_64')
url="https://github.com/nicholascw/gPNG"
license=('GPL3')
depends=('png++')
makedepends=('make' 'cmake' 'git')
replaces=("gpng")
source=('gpng::git+https://github.com/nicholascw/gPNG.git#branch=master')
md5sums=('SKIP')
epoch=1

pkgver() {
  cd gpng
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
	cd "$srcdir/gpng"
	cmake .
	make
}

package() {
	cd "$srcdir/gpng"
	install -Dm755 "$srcdir/gpng/gpng" "$pkgdir"/usr/bin/gpng
}

