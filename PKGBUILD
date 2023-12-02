# shellcheck shell=bash disable=SC2034,SC2154
_pkgname=typstfmt
pkgname=$_pkgname-git
pkgver=r307.0c873d3
pkgrel=1
pkgdesc="formatter for the Typst language"
arch=(i686 x86_64 arm aarch64)
url=https://github.com/astrale-sharp/$_pkgname
makedepends=(git)
license=(GPL3)
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
	cd "$_pkgname" || return 1
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$_pkgname" || return 1

	cargo build --release
}

package() {
	cd "$_pkgname" || return 1

	install -D "target/release/$_pkgname" -t "$pkgdir/usr/bin"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$_pkgname"
}
