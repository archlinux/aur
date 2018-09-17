# Maintainer: kpcyrd <git@rxv.cc>
# Contributor: quininer

pkgname=('alacritty' 'alacritty-terminfo')
_pkgname="alacritty"
pkgver=0.2.0
pkgrel=1
arch=('x86_64' 'i686')
url="https://github.com/jwilm/alacritty"
license=('Apache-2.0')
makedepends=('rust' 'cargo' 'cmake' 'fontconfig' 'freetype2' 'ncurses' 'desktop-file-utils')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/jwilm/alacritty/archive/v$pkgver.tar.gz")
sha256sums=('b45c3cb26b529b381593ca99712e31b4cf88f438c2435434062408462611e501')

package_alacritty() {
	pkgdesc="A cross-platform, GPU-accelerated terminal emulator"
	depends=('freetype2' 'fontconfig' 'xclip')

    cd "$_pkgname-$pkgver"

	cargo build --release --locked

	desktop-file-install -m 644 --dir "$pkgdir/usr/share/applications/" "alacritty.desktop"

	install -D -m755 "target/release/alacritty" "$pkgdir/usr/bin/alacritty"
	install -D -m644 "alacritty.man" "$pkgdir/usr/share/man/man1/alacritty.1"
	install -D -m644 "alacritty-completions.bash" "$pkgdir/usr/share/bash-completion/completions/alacritty"
	install -D -m644 "alacritty-completions.zsh" "$pkgdir/usr/share/zsh/site-functions/_alacritty"
	install -D -m644 "alacritty-completions.fish" "$pkgdir/usr/share/fish/completions/alacritty.fish"
}

package_alacritty-terminfo() {
	pkgdesc="Terminfo files for the alacritty terminal emulator"

	#cd $_pkgname
    cd "$_pkgname-$pkgver"

	install -dm 755 "$pkgdir/usr/share/terminfo/a/"
	tic -o "$pkgdir/usr/share/terminfo" alacritty.info
}
