# Maintainer: Marcel Krüger <zauguin at gmail dot com>
pkgname=stdman-git
pkgver=v0.2.r3.15f2ae8
pkgrel=1
pkgdesc="Formatted C++11/14 stdlib man pages (cppreference)"
arch=(any)
url="https://github.com/jeaye/stdman"
license=('MIT')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+https://github.com/jeaye/stdman.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --tags --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	./configure --prefix=/usr
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/" install
  install -d "$pkgdir/usr/share/licenses/stdman-git/"
  install LICENSE "$pkgdir/usr/share/licenses/stdman-git/LICENSE"
}
