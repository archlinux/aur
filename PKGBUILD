# Maintainer: Tony Lambiris <tony@libpcap.net>
pkgname=hexyl-git
pkgdesc="A command-line hex viewer"
pkgrel=1
pkgver=0.10.0.r2.g55cf7b0
arch=('i686' 'x86_64')
conflicts=("hexyl")
provides=("hexyl")
url="https://github.com/sharkdp/hexyl"
license=('Apache' 'MIT')
depends=('rust' 'cargo')
makedepends=('rust' 'cargo')
optdepends=('rust-src: rust std source code')
source=("${pkgname}::git+https://github.com/sharkdp/hexyl")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"

	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//g'
}

build() {
	cd "${srcdir}/${pkgname}"

    cargo build --release --locked
}

check() {
	cd "${srcdir}/${pkgname}"

    cargo test --release --locked
}

package() {
	cd "${srcdir}/${pkgname}"

    install -Dm 755 target/release/${pkgname%%-git} -t "${pkgdir}/usr/bin"
    install -Dm 644 LICENSE* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

