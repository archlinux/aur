# Maintainer: Folke H. 'joru' Gleumes <folke-aur@gleumes.org>
pkgname=kickoff-git
_pkgname=kickoff
pkgver=123.82ed674
pkgrel=1
pkgdesc="A simple and uncomplicated program launcher for wayland"
makedepends=('git' 'cargo' 'cmake' 'freetype2' 'fontconfig')
conflicts=(kickoff)
arch=('x86_64')
url="https://github.com/j0ru/kickoff"
license=('GPL3')
source=("git+https://github.com/j0ru/kickoff.git")
sha512sums=('SKIP')

pkgver() {
	cd "${_pkgname}"
	echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
	cd "${_pkgname}"
	cargo build --release --locked --all-features --target-dir=target
}


package() {
	cd "${_pkgname}"
	install -Dm 755 target/release/${_pkgname} -t "${pkgdir}/usr/bin"
}
