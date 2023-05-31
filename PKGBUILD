# Maintainer: pkg_maintainer <archlinuxpackagemaintainer@gmail.com>
pkgname=websurfx-edge-git
pkgver=0.11.0.r187.e45093b
pkgrel=1
epoch=
pkgdesc="An open-source alternative to Searx that provides clean, ad-free, and organic results with incredible speed while keeping privacy and security in mind."
arch=('x86_64')
url="https://github.com/neon-mmd/websurfx"
license=('AGPL3')
groups=()
depends=(rustup cargo redis)
makedepends=(git)
checkdepends=()
optdepends=()
provides=(websurfx-edge-git)
conflicts=(websurfx-git)
replaces=()
backup=()
options=()
install=${pkgname}.install
changelog=
source=("git+$url")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

pkgver() {
	cd websurfx
	printf "0.12.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd websurfx
	cargo build -r
}

package() {
	cd websurfx
    mkdir -p ${pkgdir}/etc/xdg/websurfx/
    mkdir -p ${pkgdir}/opt/websurfx/
	cp -rf public/ ${pkgdir}/opt/websurfx/public/
	install -Dm755 target/release/websurfx "${pkgdir}/usr/bin/websurfx"
	install -Dm644 websurfx/config.lua "${pkgdir}/etc/xdg/websurfx/config.lua"
	install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
