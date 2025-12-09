# Maintainer: fabse

pkgname=arnis-git
_pkgname=arnis
pkgver=0.0.r1789.ffa2316e
pkgrel=1
pkgdesc=" Generate any location from the real world in Minecraft with a high level of detail."
arch=('aarch64' 'x86_64')
url="https://github.com/louis-e/arnis"
license=("Apache-2.0")
depends=('openssl')
makedepends=('cargo' 'git')
conflicts=("arnis")
provides=("arnis")
source=('git+https://github.com/louis-e/arnis')

pkgver() {
	cd "$_pkgname"
	printf "0.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"	
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
	install -Dm755 "target/release/arnis" "$pkgdir/usr/bin/arnis"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

sha256sums=('SKIP')
