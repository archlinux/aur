pkgname=boringtun-git
pkgver=0.2.0.9.g201682d
pkgrel=1
pkgdesc="Userspace WireGuard® Implementation in Rust"
arch=('x86_64' 'i686')
url="https://github.com/cloudflare/boringtun"
license=('BSD-3-Clause')
depends=()
makedepends=('cargo' 'git')
optdepends=()
provides=('boringtun')
conflicts=('boringtun')
source=($pkgname::git+https://github.com/cloudflare/boringtun)
sha256sums=('SKIP')

pkgver() {
	cd $pkgname
	echo $(grep '^version =' Cargo.toml|head -n1|cut -d\" -f2).$(git rev-list --count HEAD).g$(git describe --always)
}

build() {
	cd $pkgname
	cargo build --release
}

package() {
	cd $pkgname
	install -D -m755 "$srcdir/$pkgname/target/release/boringtun" "$pkgdir/usr/bin/boringtun"
}
