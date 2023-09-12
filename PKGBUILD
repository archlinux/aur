# Maintainer: Vedant K <gamemaker0042 at gmail dot com>
# Note that this package was previously named dirstat-git.

_pkgname=dirstat-rs
pkgname=dirstat-rs-git
pkgver=r48.1d7bb8a
pkgrel=2
pkgdesc="A disk usage cli, similar to windirstat"
arch=('x86_64')
url="https://github.com/scullionw/dirstat-rs"
license=('MIT')
depends=('gcc-libs')
makedepends=('git' 'cargo')
provides=("$_pkgname")

_branch='master'
source=("$_pkgname::git+https://github.com/scullionw/dirstat-rs.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$_pkgname"
	
	cargo build --release
}

package() {
	cd "$srcdir/$_pkgname"
	
	install -Dm755 target/release/ds "$pkgdir/usr/bin/ds"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
