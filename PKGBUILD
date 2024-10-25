# Maintainer: Tim Teichmann <teichmanntim@outlook.de>
pkgname=canoon-git
_pkgname=canoon
pkgver=r26.744bf99
pkgrel=1
pkgdesc="Canoon is an installer for Cano, the terminal-based modal text editor."
arch=("x86_64")
url="https://github.com/kul-sudo/canoon"
license=("Apache-2.0")
depends=("glibc" "gcc-libs")
makedepends=("git" "rust")
source=("$_pkgname::git+https://github.com/kul-sudo/$_pkgname.git")
md5sums=("SKIP")

pkgver() {
	cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$_pkgname"
    cargo build --release --locked
}

package() {
	cd "$_pkgname"
    install -Dm755 "target/release/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
