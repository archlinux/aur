# Maintainer: theguy147 <yakamoz147 (at) protonmail (dot) com>

pkgname=deskent-git
_pkgname=${pkgname%-git}
pkgver=r16.1bc8eac
pkgrel=1
pkgdesc="Find and inspect .desktop files"
arch=('any')
url="https://github.com/takluyver/deskent"
license=("MIT")
makedepends=("git" "cargo")
provides=(${_pkgname})
conflicts=(${_pkgname})
source=("${_pkgname}::git+${url}.git")
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
