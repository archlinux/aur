# Maintainer: Luca Kredel <luca dot kredel at web dot de>
pkgname=({alacritty-selenized-theme,vim-selenized-colors}-git)
pkgbase=selenized-git
pkgver=v1.0.r20.048c55e
pkgrel=3
pkgdesc="Solarized redesigned: fine-tuned color palette for programmers with focus on readability. "
arch=(any)
url="https://codeberg.org/Phosphenius/selenized"
license=('MIT')
makedepends=('git') 
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgbase%-git}"

	printf "%s" "$(git describe --tags --long | sed \
		's/\([^-]*-\)g/r\1/;s/-/./g')"
}

package_alacritty-selenized-theme-git() {
	pkgdesc='Selenized theme for alacritty'
	conflicts=("${pkgname%-git}")

	cd "$srcdir/${pkgbase%-git}"

	make DESTDIR="$pkgdir/" install-alacritty-theme
}

package_vim-selenized-colors-git(){
	pkgdesc='Selenized vim color scheme'
	conflicts=(
		"${pkgname%-git}"
		vim-selenized-git
	)

	cd "$srcdir/${pkgbase%-git}"

	make DESTDIR="$pkgdir/" install-vim-colors
}
