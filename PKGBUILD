pkgname=cargo-kcov-git
_pkgname=cargo-kcov
pkgdesc="Cargo subcommand to run kcov to get coverage report on Linux"
pkgrel=1
pkgver=0.5.3.70
arch=('i686' 'x86_64')
conflicts=("cargo-kcov")
provides=("cargo-kcov")
url="https://github.com/kennytm/cargo-kcov"
license=('Apache' 'MIT')
depends=('rust' 'cargo' 'kcov')
makedepends=('rust' 'cargo')
optdepends=()
source=("$_pkgname::git+https://github.com/kennytm/cargo-kcov")
sha256sums=('SKIP')

pkgver() {
	cd $_pkgname
	echo "$(grep '^version =' Cargo.toml|head -n1|cut -d\" -f2|cut -d\- -f1).$(git rev-list --count HEAD)"
}

build() {
	cd $_pkgname
	cargo build --release
}

package() {
	cd $_pkgname
	install -D -m755 "$srcdir/$_pkgname/target/release/cargo-kcov" "$pkgdir/usr/bin/cargo-kcov"
}
