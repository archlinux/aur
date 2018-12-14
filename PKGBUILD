# Maintainer: Tony Lambiris <tony@criticalstack.com>

pkgname=websocat-git
pkgver=v1.2.0.r5.gd328450
pkgrel=1
pkgdesc="Command-line client for WebSockets"
arch=(x86_64)
url='https://github.com/vi/websocat/'
license=(MIT)
makedepends=(git rustup)
source=("${pkgname}::git+https://github.com/vi/websocat.git")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"

	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${srcdir}/${pkgname}"

	cargo build --release --features=ssl
}

package() {
	cd "${srcdir}/${pkgname}"

	install -Dm755 "target/release/websocat" "${pkgdir}/usr/bin/websocat"
}
