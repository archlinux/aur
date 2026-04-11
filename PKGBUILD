# Maintainer: fabse

pkgname=duat-git
_pkgname=duat
pkgver=v0.10.0
pkgrel=1
pkgdesc="A modern, very customizable text editor, configured in rust"
arch=('aarch64' 'x86_64')
url="https://github.com/AhoyISki/duat"
license=("GPL-3.0-or-later")
makedepends=('cargo' 'git')
conflicts=("duat")
provides=("duat")
source=('git+https://github.com/AhoyISki/duat')

pkgver() {
	cd "$_pkgname"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$_pkgname"
	cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$_pkgname"
	cargo build --release
}

package() {
	cd "$_pkgname"
	install -Dm755 "target/release/duat" "$pkgdir/usr/bin/duat"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

sha256sums=('SKIP')
