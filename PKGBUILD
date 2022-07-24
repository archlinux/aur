# Maintainer: dmadisetti <madisetti at pm dot me>
# Previous-maintainer: TabulateJarl8 <tabulatejarl8 at gmail dot com>

pkgname=steam-tui
pkgver=0.2.1
pkgrel=4
pkgdesc="Rust TUI client for steamcmd"
arch=('x86_64')
url="https://github.com/dmadisetti/steam-tui"
license=('MIT')
depends=('steamcmd')
makedepends=('cargo' 'git')
optdepends=('wine: Launch Windows games')
_commit=b56fef8498a7cf372c83c12ef9bd6cdb482f398f
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
