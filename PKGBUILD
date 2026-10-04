# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=rumos-git
pkgver=r48.ef6bb7f
pkgrel=3
pkgdesc="Command-line utility to control screen brightness"
arch=('x86_64')
url="https://github.com/octagony/rumos"
license=('unknown')
depends=()
makedepends=('cargo' 'git')
provides=('rumos')
conflicts=('rumos')
source=("rumos::git+https://github.com/octagony/rumos.git")
sha256sums=('SKIP')

pkgver() {
	cd rumos
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd rumos
	export RUSTUP_TOOLCHAIN=stable
	cargo build --release --locked || cargo build --release
}

package() {
	cd rumos
	install -Dm755 "target/release/rumos" "$pkgdir/usr/bin/rumos"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	if [ -f LICENSE ]; then
		install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	fi
}
