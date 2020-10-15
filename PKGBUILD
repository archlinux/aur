# Maintainer: Tim Park<timpark@posteo.net>

pkgname=dvd-logo-git
pkgver=1.0
pkgrel=1
pkgdesc="Watch the DVD logo bounce around in your terminal"
arch=(x86_64)
url="https://www.gitlab.com/timparktimpark/dvd-logo.git"
license=("GPL")
makedepends=(git)
provides=(dvd-logo)
source=("git+$url")
md5sums=("SKIP")

pkgver() {
	cd "$pkgname"
  printf "1.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$pkgname"
	make
}

package() {
	cd "$pkgname"
  mkdir -p "$pkgdir/opt/$pkgname"
  cp -rf * "$pkgdir/opt/$pkgname"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
