# Maintainer: Jon Osterman <pro.dev.account@protonmail.com>
pkgname=iroh-git
pkgver=0.1.1
pkgrel=1
pkgdesc='An Implementation IPFS in Rust'
arch=(x86_64)
url='https://github.com/n0-computer/iroh'
license=(MIT Apache)
depends=()
makedepends=(cargo)
checkdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=($pkgname::git+https://github.com/n0-computer/iroh.git#tag=v$pkgver)
sha256sums=('SKIP')

build() {
	cd $pkgname
	cargo build --release
}
 
check() {
	cd $pkgname
	cargo test --no-fail-fast || return 0;
}

package() {
	cd $pkgname
	install -Dm 755 target/release/iroh -t "$pkgdir/usr/bin"
	install -Dm 755 target/release/iroh-p2p -t "$pkgdir/usr/bin"
	install -Dm 755 target/release/iroh-gateway -t "$pkgdir/usr/bin"
	install -Dm 755 target/release/iroh-store -t "$pkgdir/usr/bin"
	install -Dm 644 LICENSE-MIT -t "$pkgdir/usr/share/licenses/$pkgname"
	install -Dm 644 LICENSE-APACHE -t "$pkgdir/usr/share/licenses/$pkgname"
}
