# Maintainer: spikecodes <19519553+spikecodes@users.noreply.github.com>
pkgname=tickrs-git
_pkgname=${pkgname%-git}
pkgver=0.7.1
pkgrel=1
pkgdesc="Realtime ticker data in your terminal"
arch=('any')
url="https://github.com/tarkah/tickrs"
license=("MIT")
makedepends=("git" "cargo")
provides=(${_pkgname})
conflicts=(${_pkgname})
source=("${_pkgname}::git+${url}")
sha256sums=("SKIP")

pkgver() {
	cd "${_pkgname}"
	( set -o pipefail
		printf "$(git describe --tags | awk -F- '{print $1}' | cut -c2-)"
	)
}

build() {
	cd "${_pkgname}"
	cargo build --release --locked --all-features --target-dir=target
}

package() {
	install -Dm644 "${_pkgname}/LICENSE" "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE"
	install -Dm755 "${_pkgname}/target/release/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
