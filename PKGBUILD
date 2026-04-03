# Maintainer: SelfRef <arch@selfref.dev>

_pkgbase=android-xml-converter
pkgname="$_pkgbase-git"
pkgver=11.r37.gaa393a1
pkgrel=1
pkgdesc="Android Binary XML (ABX) conversion tools"
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/rhythmcache/android-xml-converter"
license=('Apache-2.0')
makedepends=('git' 'cargo')
provides=("$_pkgbase")
conflicts=("$_pkgbase")
source=("$_pkgbase::git+https://github.com/rhythmcache/android-xml-converter.git")
sha256sums=('SKIP')

pkgver() {
	cd "$_pkgbase"
	git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//;s/^build\.//'
}

build() {
	cd "$_pkgbase"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --release
}

package() {
	cd "$_pkgbase"

	install -Dm755 "target/release/abx2xml" "$pkgdir/usr/bin/abx2xml"
	install -Dm755 "target/release/xml2abx" "$pkgdir/usr/bin/xml2abx"
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$_pkgbase/LICENSE"
}
