# Maintainer: Muhammad Hammam <warozfen1@proton.me>
pkgname=rebos-git
pkgver=r81.0aec63e
pkgrel=1
makedepends=('rust' 'cargo')
optdepends=('flatpak' 'cargo')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
pkgdesc="NixOS-like repeatability for any Linux distro."
license=('GPL-3.0-or-later')
url=https://gitlab.com/Oglo12/rebos
source=("${pkgname}::git+${url}")
sha256sums=('SKIP')
_binname=rebos

pkgver() {
	cd "${pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${pkgname}"
	cargo build --release
}

package() {
	cd "${pkgname}"
	install -Dm755 "./target/release/${_binname}" "${pkgdir}/usr/bin/${_binname}"
	install -Dm644 "./README.md" "${pkgdir}/usr/share/doc/${pkgname}"
}
