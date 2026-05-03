# Maintainer: Trumpetrespas <email [at] trumpetrespas [dot] com>
_name=zapp
pkgname=zsa-$_name
pkgver=1.0.0
pkgrel=1
epoch=
pkgdesc="Flash ZSA keyboards from your terminal."
arch=('x86_64' 'aarch64')
url="https://github.com/zsa/zapp"
license=('custom:MIT-Commons-Clause')
groups=()
depends=('glibc' 'libgcc')
makedepends=('cargo')
source=("https://github.com/zsa/$_name/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('93a35cd47d2e341e26da3038ac3e5e8f8e26d6b65f27130682fc7a95da4556c5')


# Both build and package functions were originally 
# taken from https://aur.archlinux.org/packages/zsa-zapp-git
build() {
	cd "$_name-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	unset CFLAGS CXXFLAGS LDFLAGS
	cargo build --release --locked --manifest-path zapp/Cargo.toml
}

package() {
	cd "$_name-$pkgver"
	install -vDm 755 "target/release/zapp" "$pkgdir/usr/bin/zapp"
	install -vDm 644 "udev/50-zsa.rules" "$pkgdir/usr/lib/udev/rules.d/50-zsa-zapp.rules"
	install -vDm 644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
