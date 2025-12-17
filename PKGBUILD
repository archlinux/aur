# Maintainer: Ruud van Asseldonk <aur@veniogames.com>
pkgname=rcl
pkgver=0.12.0
pkgrel=1
epoch=
pkgdesc='A reasonable configuration language'
arch=('x86_64' 'aarch64')
url='https://rcl-lang.org/'
license=('Apache-2.0')
groups=()
depends=()
makedepends=('git' 'python' 'rustup')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git+https://github.com/ruuda/rcl.git?signed#tag=v${pkgver}")
noextract=()
sha256sums=('6d1f809928b42fc95ab892ca4fd6c7ca237baa279427c0751135c2f937a60672')
validpgpkeys=(94F3C99316DFFDE10FBA6939284FE5A783926532) # Ruud van Asseldonk <dev@veniogames.com>

prepare() {
	cd "${pkgname}"
}

build() {
	cd "${pkgname}"
	# We build both the debug and release versions, because the golden tests
	# need to run against a debug binary (which has stricter limits).
	cargo build
	cargo build --release
}

check() {
	cd "${pkgname}"
	cargo test
	golden/run.py
}

package() {
	cd "${pkgname}"
	install -Dm 755 target/release/rcl "${pkgdir}/usr/bin/rcl"
	install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
