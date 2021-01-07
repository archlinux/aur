
# Maintainer: Andrea Feletto <andrea@andreafeletto.com>

pkgname=heliocron-git
_pkgname=${pkgname%-*}
pkgver=0.5.0.r0.g7fd3b66
pkgrel=2
pkgdesc='Execute tasks relative to sunset, sunrise and other solar events.'
arch=('x86_64')
url="https://github.com/mfreeborn/$_pkgname"
license=('Apache' 'MIT')
provides=('heliocron')
conflicts=('heliocron-bin')
makedepends=('cargo')
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"

	git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

build() {
	cd "$srcdir/$_pkgname"

	cargo build --release --locked --all-features --target-dir=target
}

package() {
	cd "$srcdir/$_pkgname"

	install -Dm755 "target/release/$_pkgname" -t "$pkgdir/usr/bin"
	install -Dm644 'LICENSE-APACHE' -t "$pkgdir/usr/share/licenses/$_pkgname"
	install -Dm644 'LICENSE-MIT' -t "$pkgdir/usr/share/licenses/$_pkgname"
	install -Dm644 'README.md' -t "$pkgdir/usr/share/doc/$_pkgname"
}
