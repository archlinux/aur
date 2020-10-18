# Maintainer: spikecodes <19519553+spikecodes@users.noreply.github.com>
pkgname=feroxbuster
pkgver=1.0.5
pkgrel=1
pkgdesc="A fast, simple, recursive content discovery tool written in Rust. "
arch=('any')
url="https://github.com/epi052/feroxbuster"
license=("MIT")
makedepends=("git" "cargo")
provides=(${pkgname})
conflicts=(${pkgname})
source=("${pkgname}::git+${url}")
sha256sums=("SKIP")

pkgver() {
	cd "${pkgname}"
	( set -o pipefail
		printf "$(git describe --tags | awk -F- '{print $1}' | cut -c2-)"
	)
}

build() {
	cd "${pkgname}"
	cargo build --release
}

package() {
	install -Dm755 "${pkgname}/target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
