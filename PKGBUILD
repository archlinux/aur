pkgname=steam-tui-git
_pkgname=steam-tui
pkgver=r35.5741b1f
pkgrel=2
pkgdesc="Rust TUI client for steamcmd"
url="https://github.com/dmadisetti/steam-tui"
arch=('i686' 'x86_64')
license=('MIT')
depends=('steamcmd')
makedepends=('cargo' 'git')
optdepends=('wine: Launch Windows games')
conflicts=("steam-tui")
source=("git+https://github.com/dmadisetti/steam-tui")
md5sums=('SKIP')

pkgver() {
    cd "$_pkgname"

    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$_pkgname"
	RUSTUP_TOOLCHAIN=stable cargo build --release --locked --all-features --target-dir="./"
}

check() {
	cd "$_pkgname"
	RUSTUP_TOOLCHAIN=stable cargo test --release --locked --target-dir="./"
}

package() {
	cd "$_pkgname"
	install -Dm 755 ./release/${_pkgname} -t "${pkgdir}/usr/bin"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/steam-tui" || true # since release 0.1.0 doesnt have a LICENSE file
}
