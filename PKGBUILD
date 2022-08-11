# Maintainer: sp1rit <sp1ritCS@protonmail.com>
pkgname=dbus-codegen-rust
pkgver=0.10.0
pkgrel=1
pkgdesc="This program takes D-Bus XML Introspection data and generates Rust code for calling and implementing the interfaces in the introspection data."
arch=("any")
url="https://crates.io/crates/dbus-codegen/"
license=("Apache" "MIT")
depends=("dbus" "curl" "jq")
makedepends=("cargo")
provides=(dbus-codegen-rust)
options=()
install=
changelog=
source=("https://raw.githubusercontent.com/diwic/dbus-rs/dbus-v${pkgver}/LICENSE-APACHE" "https://raw.githubusercontent.com/diwic/dbus-rs/dbus-v${pkgver}/LICENSE-MIT")
noextract=("LICENSE-APACHE" "LICENSE-MIT")
md5sums=("ec4df47d4e83d756a74349582f3e99fb" "86713ff7b5518754f2d1d5dd8dbfa694")

pkgver() {
	curl "https://crates.io/api/v1/crates/dbus-codegen" | jq -r .crate.newest_version | tr -d "\n"
}

build() {
	cargo install --root ./package --version $pkgver dbus-codegen
}

package() {	
	install -Dm755 ./package/bin/dbus-codegen-rust $pkgdir/usr/bin/$pkgname
	install -Dm644 LICENSE-APACHE $pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE
	install -Dm644 LICENSE-MIT $pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT
}
