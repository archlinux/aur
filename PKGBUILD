# Maintainer: Björn "zemrod" Bravin <sinon dot adastrum at gmail dot com>
_bpn=rawk
pkgname=$_bpn-git
pkgver=0.6.3.58.g9c7e6ca
pkgrel=1
pkgdesc="a minimal tool inspired by gawks string seperation ability"
arch=('x86_64')
url="https://gitlab.com/Zemrod/$_bpn"
license=('MIT')
depends=('gcc-libs')
makedepends=('rust' 'git')
provides=('rawk')
source=("git+$url")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$_bpn"
	printf "$(grep '^version =' Cargo.toml|head -n1|cut -d\" -f2).$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$_bpn"
	cargo build --release --locked --all-features --target-dir=target
}

check() {
	cd "$srcdir/$_bpn"
	cargo test --release --locked --target-dir=target
}

package() {
	cd "$srcdir/$_bpn"
	install -Dm755 "target/release/rawk" "$pkgdir/usr/bin/$_bpn"
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
