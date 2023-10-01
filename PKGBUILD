# Maintainer: pkg_maintainer <archlinuxpackagemaintainer@gmail.com>
pkgname=websurfx-git
pkgver=v1.0.0.r0.gca30fd5
pkgrel=1
epoch=
pkgdesc="An open-source alternative to Searx that provides clean, ad-free, and organic results with incredible speed while keeping privacy and security in mind."
arch=('x86_64')
url="https://github.com/neon-mmd/websurfx"
license=('AGPL3')
groups=()
depends=(rustup cargo luajit)
makedepends=(git)
checkdepends=()
optdepends=('redis: A redis cache server for distributed caching')
provides=(websurfx-git)
conflicts=(websurfx-edge-git)
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
    git checkout stable
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd websurfx
    git checkout stable
	cargo build -r
}

package() {
	cd websurfx
    mkdir -p ${pkgdir}/etc/xdg/websurfx/
    mkdir -p ${pkgdir}/opt/websurfx/
	cp -rf public/ ${pkgdir}/opt/websurfx/public/
	install -Dm755 target/release/websurfx "${pkgdir}/usr/bin/websurfx"
	install -Dm644 websurfx/config.lua "${pkgdir}/etc/xdg/websurfx/config.lua"
	install -Dm644 websurfx/allowlist.txt "${pkgdir}/etc/xdg/websurfx/allowlist.txt"
	install -Dm644 websurfx/blocklist.txt "${pkgdir}/etc/xdg/websurfx/blocklist.txt"
	install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
