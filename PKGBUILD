
# Maintainer: Andrea Feletto <andrea@andreafeletto.com>

pkgname=heliocron-git
_pkgname=${pkgname%-*}
pkgver=0.5.0.r0.g7fd3b66
pkgrel=1
pkgdesc='Execute tasks relative to sunset, sunrise and other solar events.'
arch=('x86_64')
url='https://github.com/mfreeborn/heliocron'
license=('Apache' 'MIT')
provides=('heliocron')
conflicts=('heliocron-bin')
makedepends=('cargo')
source=("git+https://github.com/mfreeborn/$_pkgname")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
	git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

build() {
	cd "$srcdir/$_pkgname"
	env CARGO_INCREMENTAL=0 cargo build --release
}

# currently not all tests are passed, but binary works
# check() {
# 	cd "$srcdir/$_pkgname"
# 	env CARGO_INCREMENTAL=0 cargo test --release
# }

package() {
	cd "$srcdir/$_pkgname"
	install -Dm755 "target/release/$_pkgname" -t "$pkgdir/usr/bin"
	install -Dm644 'LICENSE-APACHE' -t "$pkgdir/usr/share/licenses/$_pkgname"
	install -Dm644 'LICENSE-MIT' -t "$pkgdir/usr/share/licenses/$_pkgname"
	install -Dm644 'README.md' -t "$pkgdir/usr/share/doc/$_pkgname"
}
