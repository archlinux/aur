# Maintainer: spikecodes <19519553+spikecodes@users.noreply.github.com>
pkgname=rrrocket-git
_pkgname=${pkgname%-git}
pkgver=0.8.4
pkgrel=1
pkgdesc="Rocket League Replay parser to JSON CLI app"
arch=('x86_64')
url="https://github.com/nickbabcock/rrrocket"
license=("MIT")
makedepends=("git" "cargo")
provides=(${_pkgname})
conflicts=(${_pkgname})
source=("${_pkgname}::git+${url}")
sha256sums=("SKIP")

# pkgver() {
# 	cd "${_pkgname}"
# 	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
# }

pkgver() {
	cd "${_pkgname}"
	printf "$(git describe --tags | awk -F- '{print $1}' | cut -c2-)"
}

build() {
	cd "${_pkgname}"
	cargo build --release --locked --all-features --target-dir=target
}

package() {
	cd "${_pkgname}"
	install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE.txt"
	install -Dm755 "target/release/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
