pkgname=alacritty-git
pkgver=0.1.0.396
pkgrel=1
pkgdesc="A cross-platform, GPU enhanced terminal emulator"
arch=('x86_64' 'i686')
url="https://github.com/jwilm/alacritty"
license=('Apache-2.0')
depends=('freetype2' 'fontconfig' 'xclip')
makedepends=('cargo' 'cmake')
optdepends=()
provides=('alacritty')
conflicts=('alacritty')
source=($pkgname::git+https://github.com/jwilm/alacritty.git)
sha256sums=('SKIP')

pkgver() {
    cd $pkgname
	echo $(grep '^version =' Cargo.toml|head -n1|cut -d\" -f2).$(git rev-list --count HEAD)
}

build() {
    cd $pkgname
	cargo build --release
}

package() {
	cd $pkgname
	install -D -m755 "$srcdir/$pkgname/target/release/alacritty" "$pkgdir/usr/bin/alacritty"
	install -D -m644 "$srcdir/$pkgname/Alacritty.desktop" "$pkgdir/usr/share/applications/Alacritty.desktop"
}
