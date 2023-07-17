# shellcheck shell=bash disable=SC2034,SC2154
_pkgname=typstfmt
pkgname=$_pkgname-git
pkgver=r146.13a804b
pkgrel=2
pkgdesc="formatter for the Typst language"
arch=(x86 x86_64 arm aarch64)
url=https://github.com/astrale-sharp/$_pkgname
license=(GPL3)
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
	cd "$_pkgname" || return 1
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$_pkgname" || return 1

	cargo build
}

package() {
	cd "$_pkgname" || return 1

	install -D "target/debug/$_pkgname" -t "$pkgdir/usr/bin"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$_pkgname"
}
