# Maintainer: Robin Candau <robincandau[at]protonmail[dot]com>

pkgname=lowcharts-git
_pkgname="${pkgname%-git}"
pkgver=0.5.2.r63.4b51452
pkgrel=1
pkgdesc="Tool to draw low-resolution graphs in terminal (git version)"
arch=('x86_64' 'i686')
url="https://github.com/juan-leon/lowcharts"
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
makedepends=('git' 'rust')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
	cd "${_pkgname}"
	printf "%s.r%s.%s" "$(git describe --tags --abbrev=0 | sed 's/^v//')" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

check() {
	cd "${srcdir}/${_pkgname}"

	cargo test --locked --release
}

package() {
	cd "${srcdir}/${_pkgname}"
	
	cargo install --no-track --locked --root "${pkgdir}/usr" --path "${srcdir}/${_pkgname}"
	
	install -Dm 644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
