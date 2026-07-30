# Maintainer: Ruben Kelevra <rubenkelevra@gmail.com>

pkgname=whoneeds
pkgver=1.1
pkgrel=1
pkgdesc='Show explicitly installed Arch packages that depend on a package'
arch=('x86_64')
url='https://github.com/RubenKelevra/whoneeds'
license=('GPL-2.0-only')
depends=('pacman-contrib')
makedepends=('cargo')
conflicts=(
           'pkgtools'
           'pkgtools-git'
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
b2sums=('a5af6e8ac112bac21f6b54a9ad6e1b2ea886ac6f8cd86204b706661f2178a5367883e12d6705bad3a774ae13029495d91b3a3e0a13ef587114c27225fa564965')

build() {
	cd "${pkgname}-${pkgver}"
	cargo build --release --locked
}

check() {
	cd "${pkgname}-${pkgver}"
	cargo test --locked
}

package() {
	cd "${pkgname}-${pkgver}"
	install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
	install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
