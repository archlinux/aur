# Maintainer: spikecodes <19519553+spikecodes@users.noreply.github.com>
pkgname=the-way-git
_pkgname=${pkgname%-git}
pkgver=0.20.3
pkgrel=1
pkgdesc="A command line code snippets manager"
arch=('any')
url="https://github.com/out-of-cheese-error/the-way"
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
	cargo build --locked --release
}

package() {
	install -Dm644 "${_pkgname}/LICENSE" "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE"
	install -Dm755 "${_pkgname}/target/release/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
