# Maintainer: dmadisetti <madisetti at pm dot me>
# Previous-maintainer: TabulateJarl8 <tabulatejarl8 at gmail dot com>

pkgname=steam-tui
pkgver=0.3.0b
pkgrel=6
pkgdesc="Rust TUI client for steamcmd"
arch=('x86_64')
url="https://github.com/dmadisetti/steam-tui"
license=('MIT')
depends=('steamcmd')
makedepends=('cargo' 'git')
optdepends=('wine: Launch Windows games')
_commit=f5d2a4f75ade23f21da18051a5469f2a084ec300
source=("git+https://github.com/dmadisetti/steam-tui#commit=$_commit")
sha512sums=('SKIP')

build() {

	cd "$pkgname"
	RUSTUP_TOOLCHAIN=stable cargo build --release --locked --all-features --target-dir="./"

}

check() {
	cd "$pkgname"
	RUSTUP_TOOLCHAIN=stable cargo test --release --locked --target-dir="./"
}

package() {
	cd "$pkgname"
	install -Dm 755 ./release/${pkgname} -t "${pkgdir}/usr/bin"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/steam-tui" || true # since release 0.1.0 doesnt have a LICENSE file
}
