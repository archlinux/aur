pkgname=cargo-dinghy-git
_pkgname=dinghy
pkgdesc="Easier cross-compilation for phones and single boards computers"
pkgrel=1
pkgver=0.4.19.552
arch=('i686' 'x86_64')
conflicts=("cargo-dinghy")
provides=("cargo-dinghy")
url="https://github.com/snipsco/dinghy"
license=('Apache' 'MIT')
depends=('rust' 'cargo')
makedepends=('rust' 'cargo')
optdepends=('android-tools: android support' 'android-ndk: android support')
source=("$_pkgname::git+https://github.com/snipsco/dinghy")
sha256sums=('SKIP')

pkgver() {
	cd $_pkgname/cargo-dinghy
	echo "$(grep '^version =' Cargo.toml|head -n1|cut -d\" -f2|cut -d\- -f1).$(git rev-list --count HEAD)"
}

build() {
	cd $_pkgname/cargo-dinghy
	cargo build --release
}

package() {
	cd $_pkgname
	install -D -m755 "$srcdir/$_pkgname/target/release/cargo-dinghy" "$pkgdir/usr/bin/cargo-dinghy"
}
