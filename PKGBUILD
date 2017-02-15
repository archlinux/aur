# Maintainer: Tudor Roman <tudurom@gmail.com>

pkgname=ruler-git
pkgver=0.1.0.r0.gaaf9d5c
pkgrel=1
pkgdesc="Program used to create window rules."
arch=("i686" "x86_64" "armv7h" "aarch64")
url="https://github.com/tudurom/ruler"
license=('ISC')
depends=("libxcb" "xcb-util-wm")
makedepends=("git")
optdepends=("wmutils-git")
conflicts=('ruler')
source=("$pkgname::git+https://github.com/tudurom/ruler.git")
md5sums=("SKIP")

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags | sed -r 's/^v//g;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/$pkgname"
	make
}

package() {
	cd "$srcdir/$pkgname"
	make PREFIX="/usr" DESTDIR="$pkgdir/" install
}
