# Maintainer: Vir Chaudhury <virchau13@mail.hexular.net>
# Maintainer: Edward Wibowo <wibow9770@gmail.com>
pkgname=ambit-git
_pkgname="ambit"
pkgver=0.1.0.r75.g897e5cf
pkgrel=1
pkgdesc="Dotfile manager written in Rust."
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/plamorg/ambit"
license=('GPL3')
makedepends=('rust' 'cargo' 'git')
provides=("ambit")
conflicts=("ambit-bin")
options=("strip")
source=("$_pkgname::git+https://github.com/plamorg/ambit.git")
sha256sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	printf "%s\n" "$(grep '^version =' Cargo.toml | head -n1 | cut -d\" -f2).r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
	cd "$_pkgname"
	env CARGO_INCREMENTAL=0 cargo build --release --locked
}

check() {
	cd "$_pkgname"
	env CARGO_INCREMENTAL=0 cargo test --release
}

package() {
	cd "$_pkgname"
	install -Dm755 "target/release/ambit" -t "$pkgdir/usr/bin/"
}
