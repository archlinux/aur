# Maintainer: Tudor Roman <tudurom@gmail.com>

pkgname=safe-git
pkgver=1.1.r0.g7958db7
pkgrel=1
pkgdesc="Password protected secret keeper"
arch=("i686" "x86_64" "armv7h" "aarch64")
url="https://z3bra.org/safe"
provides=("safe")
license=("ISC")
depends=("libsodium")
makedepends=("git")
optdepends=('thinglaunch: password prompt')
source=("$pkgname::git://z3bra.org/safe.git")
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
	install -Dm644 LICENSE \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
