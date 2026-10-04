# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=charfreq-git
pkgver=r2.c7c67f3
pkgrel=3
pkgdesc="Count unicode character frequency from stdin"
arch=('x86_64')
url="https://github.com/proycon/charfreq"
license=('GPL-3.0-or-later')
depends=()
makedepends=('cargo' 'git')
provides=('charfreq')
conflicts=('charfreq')
source=("charfreq::git+https://github.com/proycon/charfreq.git")
sha256sums=('SKIP')

pkgver() {
	cd charfreq
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd charfreq
	export RUSTUP_TOOLCHAIN=stable
	cargo build --release --locked || cargo build --release
}

package() {
	cd charfreq
	install -Dm755 "target/release/charfreq" "$pkgdir/usr/bin/charfreq"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	if [ -f LICENSE ]; then
		install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	fi
}
