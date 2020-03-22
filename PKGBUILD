# Maintainer: Tobias Fuchs <fuchstobs@gmail.com>
pkgname=dwm-zarcastic-git
pkgver=r1690.9e1e366
pkgrel=1
pkgdesc="A dynamic window manager for X - patched version"
arch=('i686' 'x86_64')
url="https://gitlab.com/ZarCastic/dynamic-window-manager.git"
license=('MIT')
depends=('libx11' 'libxinerama' 'libxft' 'freetype2' 'st' 'dmenu')
makedepends=( 'make') 
optdepends=(nerd-fonts-complete ttf-symbola)
provides=("dwm")
conflicts=("dwm")
source=("dwm-zarcastic::git+${url}")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "6.2.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
  make PREFIX=/usr DESTDIR="${pkgdir}" install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/dwm-zarcastic/LICENSE"
  install -Dm644 applied_patches.txt "${pkgdir}/usr/share/doc/dwm-zarcastic/applied_patches.txt"
  install -Dm644 "${srcdir}/dwm-zarcastic/dwm.desktop" "$pkgdir/usr/share/xsessions/dwm.desktop"

}
