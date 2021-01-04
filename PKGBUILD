# Maintainer: spikecodes <19519553+spikecodes@users.noreply.github.com>
pkgname=libreddit-git
_pkgname=${pkgname%-git}
pkgver=r27.c4b9400
pkgrel=1
pkgdesc="Alternative private front-end to Reddit"
arch=('x86_64')
url="https://github.com/spikecodes/libreddit"
license=("AGPL-3.0")
makedepends=("git" "cargo" "rustup")
provides=(${_pkgname})
conflicts=(${_pkgname})
source=("${_pkgname}::git+${url}")
sha256sums=("SKIP")

pkgver() {
	cd "${_pkgname}"
	( set -o pipefail
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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
