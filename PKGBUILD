# Maintainer: curlpipe <11898833+curlpipe@users.noreply.github.com>
pkgname=ox-git
_pkgname=${pkgname%-git}
pkgver=0.2.7
pkgrel=1
pkgdesc="An independent Rust text editor that runs in your terminal!"
arch=('any')
url="https://github.com/curlpipe/ox"
license=("GPLv2")
makedepends=("git" "cargo")
depends=("ttf-nerd-fonts-symbols-mono")
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
}

package() {
	install -Dm755 "${_pkgname}/target/release/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
