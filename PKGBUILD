# Maintainer: Sam Whited <sam@samwhited.com>

pkgname=cadja
pkgver=0.2.4
pkgrel=1
pkgdesc="A music library indexer and database for DJs."
arch=('x86_64')
url="https://codeberg.org/OpenDJLab/cadja"
license=('GPL-3.0-only')
groups=(pro-audio)
makedepends=(cargo-nightly)
source=("${pkgname}-${pkgver}.zip::https://codeberg.org/OpenDJLab/cadja/archive/v$pkgver.zip")
sha256sums=('1106022ddaff721162ae815fdccd2307f140255a4fde9bc23bf9382f6b6ea43b')

prepare() {
	cd $pkgname
	export RUSTUP_TOOLCHAIN=nightly
	cargo fetch --locked #--target host-tuple
}

build() {
	cd $pkgname
	export RUSTUP_TOOLCHAIN=nightly
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features
}

package() {
	# The package got renamed at some point since the last tag, go ahead and
	# rename the binary cadja.
	install -Dm0755 -T "$srcdir/$pkgname/target/release/caja" "$pkgdir/usr/bin/$pkgname"
}

# vim:set ts=2 sw=2
