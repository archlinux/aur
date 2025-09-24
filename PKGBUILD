# Maintainer: George Hu <integral@archlinux.org>

pkgname=vanissh-git
_pkgname=${pkgname%-git}
pkgver=r4.c2ee470
pkgrel=1
pkgdesc="Generate vanity SSH public keys that start or end with specified strings"
arch=('x86_64' 'aarch64' 'riscv64')
url="https://github.com/k4yt3x/${_pkgname}"
license=('AGPL-3.0-or-later')
depends=('libssh')
makedepends=('git' 'meson')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
	cd "${_pkgname}/"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
	arch-meson "${_pkgname}" build
	meson compile -C build
}

package() {
	meson install -C build --destdir "${pkgdir}"
}
