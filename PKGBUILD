# Maintainer: joel <aullidolunar at gmai1 d0t c0m>
# Maintainer: orumin <dev@orum.in>

_gitname=macOS-Sierra

pkgname=osx-el-capitan-theme-git
pkgdesc="Theme mimics OS X 10.12 macOS Sierra, formaly osx-el-capitan-theme, for GTK3 and some DEs (GNOME Shell, Xfce, Cinnamon)"
pkgver=4.1.r2.gb245f91
pkgrel=1
arch=('any')
url="https://github.com/Elbullazul/${_gitname}"
source=(git+https://github.com/B00merang-Project/${_gitname})
makedepends=('git')
depends=('gtk3>=3.18' 'gtk-engine-murrine' 'gtk-engines')
optdepends=('gnome-themes-standard: Required for the GTK3 theme')
license=('GPL3')
conflicts=('gnome-shell-theme-osx-el-capitan')
sha256sums=('SKIP')

pkgver() {
	cd "$_gitname"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd "$srcdir/$_gitname"
	if test -d "$srcdir/$_gitname/Wallpaper.jpg"
	then
		mkdir -p "$pkgdir/usr/share/backgrounds"
		mv 'Wallpaper.jpg' "$pkgdir/usr/share/backgrounds"
	fi
	# Keep compatibility with old name
	find . -type f -not -path './.git/*' -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/OS-X-El-Capitan/{}" \;
}
