# Maintainer: spikecodes <19519553+spikecodes@users.noreply.github.com>
pkgname=the-way
pkgver=0.10.0
pkgrel=1
pkgdesc="A command line code snippets manager"
arch=('any')
url="https://github.com/out-of-cheese-error/the-way"
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
