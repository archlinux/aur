# Maintainer: Tim Park<timpark@posteo.net>
pkgname=dvd-logo-git
pkgver=1.0.r1.eab3fd8
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
  cd dvd-logo
  printf "1.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd dvd-logo
	make
}

package() {
	cd dvd-logo 
  mkdir -p "$pkgdir/opt/$pkgname"
  cp -rf * "$pkgdir/opt/$pkgname"
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
