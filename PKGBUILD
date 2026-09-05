# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=plox-git
pkgver=r24.98b05cd
pkgrel=1
pkgdesc="Extract numeric values from log files and plot them over time"
arch=('x86_64')
url="https://github.com/michalkucharczyk/plox"
license=('unknown')
depends=()
makedepends=('cargo' 'git')
provides=('plox')
conflicts=('plox')
source=("plox::git+https://github.com/michalkucharczyk/plox.git")
sha256sums=('SKIP')

pkgver() {
	cd plox
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd plox
	export RUSTUP_TOOLCHAIN=stable
	cargo build --release
}

package() {
	cd plox
	install -Dm755 "target/release/plox" "$pkgdir/usr/bin/plox"
	if [ -f LICENSE ]; then
		install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	fi
}
