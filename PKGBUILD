# Maintainer: spikecodes <19519553+spikecodes@users.noreply.github.com>
pkgname=dot-git
_pkgname=${pkgname%-git}
pkgver=0.1.4
pkgrel=1
pkgdesc="Yet another management tool for dotfiles"
arch=('x86_64')
url="https://github.com/ubnt-intrepid/dot"
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
