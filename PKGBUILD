# Maintainer: Ruben Kelevra <rubenkelevra@gmail.com>

pkgname=whoneeds
pkgver=1.0
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
b2sums=('cf74cdf3b7b30a7b0064d94beb7880b4248bad82e8aefba3eea60fe4c9b8e7482c0b0897693e9d4a37518d9f40968a8941f87bda34326e57ea33e377de3fa9b0')

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
