# Maintainer: Éric NICOLAS <ccjmne@gmail.com>
pkgname=xray-oci-git
pkgver=v1.3.1.r0.98a29c8
pkgrel=1
pkgdesc="A blazing fast Docker (or any OCI-compliant) image layer inspector"
arch=('any')
url="https://github.com/h33333333/xray"
license=('GPL-3.0')
makedepends=('git' 'rust-nightly')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('upstream::git+https://github.com/h33333333/xray')
md5sums=('SKIP')

pkgver() {
	cd upstream
	printf "%s" "$(git describe --tags --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd upstream
	cargo +nightly build --release
}

check() {
	cd upstream
	cargo +nightly test --all
}

package() {
	cd upstream
	install -D -m755 target/release/xray "$pkgdir/usr/bin/xray"
	install -D -m644 COPYING             "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
