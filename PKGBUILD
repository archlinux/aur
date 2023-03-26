# Maintainer: Antoine Lubineau <antoine@lubignon.info>

pkgname=fuc
pkgver=1.1.6
pkgrel=1
pkgdesc="Modern, performance focused unix commands"
arch=('x86_64')
url="https://github.com/SUPERCILEX/fuc"
license=('Apache')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/SUPERCILEX/fuc/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('94be9005ea08a2b1cd2d5732df47abad7e4ca68b864fb832f8bd47e42cd2f5fd')

_commands=('cpz' 'rmz')

build() {
	cd "$pkgname-$pkgver"
	for _command in ${_commands[@]}; do
		cargo build --release --locked --manifest-path "${_command}/Cargo.toml"
	done
}

check() {
	cd "$pkgname-$pkgver"
	for _command in ${_commands[@]}; do
		cargo test --release --locked --manifest-path "${_command}/Cargo.toml"
	done
}

package() {
	cd "$pkgname-$pkgver"
	for _command in ${_commands[@]}; do
		CARGO_INSTALL_ROOT="${pkgdir}/usr" cargo install --locked --no-track --path "$_command"
	done
}
