# Maintainer: Jason Nader <jason d0t nader pr0t0nmail.c0m>

pkgname=cargo-cache-git
_pkgname=cargo-cache
pkgver=0.4.2.1098.ga354167
pkgrel=1
pkgdesc="Display info and prune cargo cache"
arch=('x86_64')
url="https://github.com/matthiaskrgr/cargo-cache"
source=("${pkgname%-*}::git+https://github.com/matthiaskrgr/cargo-cache")
license=('MIT')
depends=('cargo')
makedepends=('cargo')
provides=('cargo-cache')
conflicts=('cargo-cache')
sha256sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	echo $(grep '^version =' Cargo.toml|head -n1|cut -d\" -f2).$(git rev-list --count HEAD).g$(git describe --always)
}

build() {
	cd "$_pkgname"
	cargo build --release
}

package() {
	cd "$_pkgname"
	install -Dm755 "$srcdir/${pkgname%-*}/target/release/cargo-cache" "$pkgdir/usr/bin/cargo-cache"
	install -Dm644 LICENSE-MIT "$pkgdir"/usr/share/licenses/"${pkgname%-*}"/LICENSE
}
