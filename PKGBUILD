# Maintainer: Edmund Lodewijks < e.lodewijks @ gmail.com >
# Contributor: éclairevoyant

_pkgname=autorandr
pkgname="$_pkgname-git"
pkgver=1.15.r3.g770dc86
pkgrel=1
pkgdesc="Auto-detect connected display hardware and load appropiate X11 setup using xrandr"
arch=(any)
url="https://github.com/phillipberndt/$_pkgname"
license=(GPL-3.0-only)
depends=(python xorg-xrandr)
makedepends=(desktop-file-utils git)
optdepends=(
	"pm-utils: For changing autorandr profile on thaw/resume"
	"xorg-xdpyinfo: For detecting the primary XRandR output"
	"bash-completion: auto-completion for autorandr in Bash"
	"fish-completion: auto-completion for autorandr in fish"
	"zsh-completions: auto-completion for autorandr in ZSH"
)
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url.git")
sha512sums=('SKIP')
b2sums=('SKIP')

pkgver() {
	git -C $_pkgname describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd $_pkgname
	make DESTDIR="$pkgdir" PREFIX=/usr install
	# Bash completion
	install -vDm 644 contrib/bash_completion/$_pkgname -t "$pkgdir/usr/share/bash-completion/completions/"
	# zsh completion - enable if needed
#	install -vDm 644 contrib/zsh_completion/_$_pkgname -t "$pkgdir/usr/share/zsh/site-functions/"
	# fish completion - enable if needed
#	install -vDm 644 contrib/fish_completion/$_pkgname.fish -t "$pkgdir/usr/share/fish/vendor_completions.d/"
	# docs
	install -vDm 644 README.md -t "$pkgdir/usr/share/doc/$_pkgname/"
	# Install man-page
	install -vDm 644 autorandr.1 -t "$pkgdir/usr/share/man/man1/"
}
