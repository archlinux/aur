# Maintainer: Tony Lambiris <tony@libpcap.net>

pkgname=hx-git
pkgdesc="Futuristic take on hexdump."
pkgrel=2
pkgver=v0.1.3.r20.g66f0a6d
arch=('i686' 'x86_64')
url="https://github.com/sitkevij/hex"
license=('MIT')
depends=('rust' 'cargo')
makedepends=('rust' 'cargo')
optdepends=('rust-src: rust std source code')
source=("${pkgname}::git+https://github.com/sitkevij/hex")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"

	#printf "%s.%s" "$(grep -m1 '^version =' Cargo.toml | cut -d\" -f2)" "$(git rev-list --count HEAD)"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${srcdir}/${pkgname}"

	make
}

check() {
	cd "${srcdir}/${pkgname}"

	make test
}

package() {
	cd "${srcdir}/${pkgname}"

	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm755 "target/release/hx" "${pkgdir}/usr/bin/hx"
}
