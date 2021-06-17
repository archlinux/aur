# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>

pkgname=afetch
pkgver=2.2.0
pkgrel=1
pkgdesc="A fetch program written in C"
arch=('x86_64' 'aarch64' 'armv7l')
url="https://github.com/13-CF/afetch"
license=('GPL3')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/V$pkgver.tar.gz")
sha256sums=('e1f4630b2f8aea0edb76676afbfba9b92c819c6df5da68eb5b89da9c330e2fcd')

build() {
	cd "$pkgname-$pkgver"
	echo ":: If $pkgname fails to compile, check that you have a libc installed with pthread support."
	make CFLAGS="${CFLAGS} -std=c99" LDFLAGS="${LDFLAGS} -lpthread" all
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm 755 "$pkgname" -t "$pkgdir/usr/bin/"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
