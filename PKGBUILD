# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>
# Contributor: Tirth Jain <jaintirth24@gmail.com>

pkgname=zettl-git
_pkgname=zettl
pkgver=r9.9430608
pkgrel=1
pkgdesc="A blazing fast note-taking system"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://github.com/hedonhermdev/zettl"
license=('custom')
makedepends=('git' 'rust' 'cargo')
source=("git+$url.git")
b2sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

check() {
	cd "$_pkgname"
	RUSTUP_TOOLCHAIN=stable cargo test --release --locked --target-dir=target
}

build() {
	return 0
}

package() {
	cd "$_pkgname"
	cargo install --no-track --locked --all-features --root "$pkgdir/usr/" --path .
}
