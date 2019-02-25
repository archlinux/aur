pkgname=('wezterm-git')
_pkgname="wezterm"
pkgdesc="A terminal emulator implemented in Rust, using OpenGL ES 2 for rendering."
pkgver=0.1.0.696.gab0c5a8
pkgrel=1
arch=('x86_64' 'i686')
url="https://github.com/wez/wezterm"
license=('MIT')
depends=('freetype2' 'fontconfig' 'libegl' 'harfbuzz' 'xcb-util-wm' 'xcb-util-keysyms' 'python' 'libxkbcommon-x11')
makedepends=('rust' 'cargo' 'cmake' 'git' 'ragel')
source=("$_pkgname::git+https://github.com/wez/wezterm.git")
sha256sums=('SKIP')

pkgver() {
	cd $_pkgname
	echo "$(grep '^version =' Cargo.toml|head -n1|cut -d\" -f2).$(git rev-list --count HEAD).g$(git describe --always)"
}

build() {
	cd $_pkgname
	cargo build --release
}

package() {
	cd $_pkgname
	install -D -m755 "$srcdir/$_pkgname/target/release/wezterm" "$pkgdir/usr/bin/wezterm"
}

