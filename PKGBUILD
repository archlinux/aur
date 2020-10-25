# Maintainer: spikecodes <19519553+spikecodes@users.noreply.github.com>
pkgname=xcp-git
_pkgname=${pkgname%-git}
pkgver=r298.5125c3c
pkgrel=1
pkgdesc="An extended cp"
arch=('x86_64')
url="https://github.com/tarka/xcp"
license=("GPL-3.0")
makedepends=("git" "cargo")
provides=(${_pkgname})
conflicts=(${_pkgname})
source=("${_pkgname}::git+${url}")
sha256sums=("SKIP")

pkgver() {
	cd "${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${_pkgname}"
	cargo build --release --locked --all-features --target-dir=target
}

package() {
	cd "${_pkgname}"
	install -Dm644 COPYING "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE"
	install -Dm755 "target/release/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
