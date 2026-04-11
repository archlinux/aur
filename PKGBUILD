pkgname=boringtun-git
pkgver=0.7.0.r2.gfa97920
pkgrel=1
pkgdesc="Userspace WireGuard® Implementation in Rust"
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/cloudflare/boringtun"
license=('BSD-3-Clause')
depends=('gcc-libs')
makedepends=('cargo' 'git')
optdepends=('wireguard-tools: tools and scripts for interface setup')
provides=('boringtun')
conflicts=('boringtun')
source=($pkgname::git+https://github.com/cloudflare/boringtun.git)
sha256sums=('SKIP')
options=('!lto')

pkgver() {
	cd $pkgname
	git describe --long --tags --match 'boringtun-cli-*' | sed 's/^boringtun-cli-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd $pkgname
	cargo build --release --bin boringtun-cli
}

package() {
	cd $pkgname
	install -D -m755 "$srcdir/$pkgname/target/release/boringtun-cli" "$pkgdir/usr/bin/boringtun"
}
