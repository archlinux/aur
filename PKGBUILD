# Maintainer: Max Guppy (skylifegame@gmail.com) 
pkgname=runscript-git
_pkgname=runscript
pkgver=r237.83a3797
pkgrel=1
pkgdesc="Command runner for project-specific commands"
url="https://git.sr.ht/~theonlymrcat/runscript"
_git="https://git.sr.ht/~theonlymrcat/${_pkgname}"
arch=(x86_64)
license=('Apache')
makedepends=('cargo' 'git')
depends=()
provides=('run')
conflicts=('runscript')
source=("${_pkgname}::git+${_git}")
sha256sums=('SKIP')

pkgver() {
    cd "${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${_pkgname}"
	cargo build --release --locked
}

check() {
	cd "${_pkgname}"
	cargo test --all-features
}

package() {
	cd "${_pkgname}"
	install -Dm 0755 "target/release/run" "${pkgdir}/usr/bin/run"
}
