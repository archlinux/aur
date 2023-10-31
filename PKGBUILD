# Maintainer: Michael Lass <bevan@bi-co.net>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=trurl
pkgver=0.9
pkgrel=1
pkgdesc="Command line tool for URL parsing and manipulation"
arch=(x86_64)
url="https://github.com/curl/trurl"
license=(custom)
depends=(curl)
checkdepends=(python)
source=("https://github.com/curl/$pkgname/archive/refs/tags/$pkgname-$pkgver.tar.gz"
        "https://github.com/curl/trurl/commit/c7225108d7612ef918ff4eb3c71179a40128013b.patch")
sha256sums=('848da38c0ea07cd96d6adac4a5e5e141fe26e5bd846039aa350c3ca589a948e0'
            'd7d8f76edfa2365818b32c2e0deb2fda7035b42c46e171b0a8a5ee0d1bdeb2b4')

prepare() {
	cd "$pkgname-$pkgname-$pkgver"
	patch -p1 < "${srcdir}/c7225108d7612ef918ff4eb3c71179a40128013b.patch"
}

build() {
	cd "$pkgname-$pkgname-$pkgver"
	make
}

check() {
	cd "$pkgname-$pkgname-$pkgver"
	make test
}

package() {
	cd "$pkgname-$pkgname-$pkgver"

	make PREFIX=/usr DESTDIR="$pkgdir/" install
	install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}
