# Maintainer: hood <hood@null.net>


pkgname=rudo
_pkgname=rudo
pkgver=r9.178ea23
pkgrel=1
pkgdesc="A minimal todo manager written in Rust."
arch=('any')
url="https://github.com/hood/rudo"
license=("GPLv2")
makedepends=("git" "cargo")
provides=(${_pkgname})
conflicts=(${_pkgname})
source=("${_pkgname}::git+${url}")
sha256sums=("SKIP")

pkgver() {
	cd "${_pkgname}"
	( set -o pipefail
		git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build() {
	cd "${_pkgname}"
	cargo build --release
    mkdir -p ~/rudo/
    touch ~/rudo/store.json
    echo '{"list":[]}' > ~/rudo/store.json
}

package() {
	install -Dm755 "${_pkgname}/target/release/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
